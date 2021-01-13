---
title: Xử lý code smell Primitive Obsession – Part 2 – Replace Type Code with Class
author: blackntt
type: post
date: 2018-07-26T07:34:13+00:00
url: /xu-ly-code-smell-primitive-obsession-part-2-replace-type-code-with-class/
timeline_notification:
  - 1532590456
categories:
  - Refactoring

---
Part 1 của việc xử lý Primitive Obsession được giới thiệu trong bài post trước (có thể đọc lại ở link [Xử lý code smell Primitive Obsession – Part 1][1])

Phần này sẽ tiếp tục với việc trao đổi về xử lý Primitive Obsession với tình huống khi dữ liệu là dạng type code (dùng các biến chứa giá trị tương đương các mã để xác nhận đối tượng thuộc kiểu nào).

Ví dụ về type code:

<img class=" size-full wp-image-184 aligncenter" src="http://blacklogs.net/wp-content/uploads/2018/07/untitled2.png" alt="Untitled.png" width="500" height="273" /> 

Có 1 class Person, class này sử dụng 4 biến chứa 4 giá trị quy định nhóm máu (0,A, B, AB). và 1 thuộc tính bloodGroup nếu bloodGroup có giá trị bằng giá trị đang lưu trong các type code (0,A,B,AB) thì người đó sẽ có nhóm máu đó.

Một vấn đề của việc sử dụng type code đó là bản chất của nó ở đây vẫn là kiểu dữ liệu cơ bản nên bộ biên dịch chỉ kiểu ta kiểu dữ liệu thực của các type code, không biết được ý nghĩa nên có thể nhận nhầm một biến thường với biến là nhóm máu. nếu bên ngoài có truyền giá trị vào có thể truyền giá trị cùng kiểu cơ bản nhưng không có hàm nghĩa đúng với tên của type code thì chương trình vẫn cho là hợp lệ và không nhận ra lỗi ý nghĩa ở đây.  Nếu ta dùng class thay thế ở đây, thì lúc này bộ biên dịch sẽ kiểu trả kiểu dữ liệu có khớp hay không và lúc này sẽ đảm bảo đúng kiểu đúng ý nghĩa.

Nếu trong tình huống đó, việc thay type code bằng một class vẫn không ảnh hướng đến hành vi bên trong các câu lệnh switch ta có thể sử dụng kĩ thuật **Replace Type Code with Class **(thay type code bằng class). Trong tình huống ngôn ngữ lập trình chỉ hỗ trợ switch case với kiểu dữ liệu số thì ta cần phải sử dụng kĩ thuật **Replace Conditional with Polymorphism **thay thế các lệnh điều kiện bằng đa hình. Và trong tình huống đó type code phải được xử lý bằng kĩ thuật **Replace Type Code with Subclasses** hoặc  
**Replace Type Code with State/Strategy (liên quan đến design pattern).**

Kĩ thuật **Replace Type Code with Class**  
Sau đây là chi tiết về một ví dụ kinh điển trong các sách về Refactoring cho trường hợp sử dụng Replace Type code with class  
Ban đầu ta có class Person:

<pre class="toolbar:2 lang:java decode:true">class Person {
public static final int O = 0;
public static final int A = 1;
public static final int B = 2;
public static final int AB = 3;
private int _bloodGroup;

public Person(int bloodGroup) {
_bloodGroup = bloodGroup;
}

public void setBloodGroup(int arg) {
_bloodGroup = arg;
}

public int getBloodGroup() {
return _bloodGroup;
}
}</pre>

Sau khi sử dụng kĩ thuật Replace type code with class thì có kết quả cuối cùng như sau:

<pre class="toolbar:2 lang:java decode:true">class Person{
private BloodGroup _bloodGroup;

public Person(BloodGroup bloodGroup) {
_bloodGroup = bloodGroup;
}

public BloodGroup getBloodGroup() {
return _bloodGroup;
}

public void setBloodGroup(BloodGroup arg) {
_bloodGroup = arg;
}
}</pre>

<pre class="toolbar:2 lang:java decode:true">class BloodGroup{
public static final BloodGroup O = new BloodGroup(0);
public static final BloodGroup A = new BloodGroup(1);
public static final BloodGroup B = new BloodGroup(2);
public static final BloodGroup AB = new BloodGroup(3);
public static final BloodGroup[] _values = new BloodGroup[] {O,A,B,AB};
private final int _code;
private BloodGroup(int code) {
_code = code;
}
private int getCode() {
return _code;
}
private static BloodGroup code(int arg) {
return _values[arg];
}

}</pre>

Nhận xét: lúc này bên ngoài sử dụng hay liên quan gì về nhóm máu đề phải thông qua class BloodGroup và bộ biên dịch có thể kiểm tra được kiểu dữ liệu cũng như ý nghĩa. Bên ngoài cũng không có khả năng tùy tiện tạo ra các nhóm máu mới hay can thiệp vào.

Chú ý: vì ta đang refactoring trên source code có trước. nên việc thay đổi class phải làm sao bên ngoài vẫn sử dụng được class đúng, không bị lỗi. Để đảm bảo quá trình ra đúng thì cần thực hiện các bước chi tiết như sau:

Code ban đầu của class **Person:**

<pre class="toolbar:2 lang:java decode:true">class Person {
public static final int O = 0;
public static final int A = 1;
public static final int B = 2;
public static final int AB = 3;
private int _bloodGroup;

public Person(int bloodGroup) {
_bloodGroup = bloodGroup;
}

public void setBloodGroup(int arg) {
_bloodGroup = arg;
}

public int getBloodGroup() {
return _bloodGroup;
}
}</pre>

Ta tạo một class BloodGroup như đoạn code dưới. Lúc này ta tạo class BloodGroup mang tính đóng gói các kiểu blood của person lại và tạo phương thức để bên phía person và client không bị ảnh hướng:

<pre class="toolbar:2 lang:java decode:true ">class BloodGroup{
public static final BloodGroup O = new BloodGroup(0);
public static final BloodGroup A = new BloodGroup(1);
public static final BloodGroup B = new BloodGroup(2);
public static final BloodGroup AB = new BloodGroup(3);
public static final BloodGroup[] _values = new BloodGroup[] {O,A,B,AB};
private final int _code;
private BloodGroup(int code) {
_code = code;
}
public int getCode() {
return _code;
}
public static BloodGroup code(int arg) {
return _values[arg];
}

}</pre>

và điều chỉnh class Person lại như sau:

<pre class="toolbar:2 lang:java decode:true">class Person {
public static final int O = BloodGroup.O.getCode();
public static final int A = BloodGroup.A.getCode();
public static final int B = BloodGroup.B.getCode();
public static final int AB = BloodGroup.AB.getCode();
private BloodGroup _bloodGroup;

public Person(int bloodGroup) {
_bloodGroup = BloodGroup.code(bloodGroup);
}

public void setBloodGroup(int arg) {
_bloodGroup =BloodGroup.code(arg);
}

public int getBloodGroup() {
return _bloodGroup.getCode();
}
}</pre>

Tiếp tục đổi tên các tham số, tên hàm (**Rename method**) để khớp với ý nghĩa của chúng. Đổi **arg** thành **code**, Đổi **getBloodGroup** thành **getBloodGroup**, đổi **setBloodGroup** thành **setBloodGroupCode**, chỉnh tên các hàm với phía client có gọi Person liên quan đến các chỗ chỉnh sửa cho hợp lí, và đổi các chỗ gọi **Person.A** thành **BloodGroup.O.getCode()**,&#8230;.

<pre class="toolbar:2 lang:java decode:true ">class Person {
public static final int O = BloodGroup.O.getCode();
public static final int A = BloodGroup.A.getCode();
public static final int B = BloodGroup.B.getCode();
public static final int AB = BloodGroup.AB.getCode();
private BloodGroup _bloodGroup;

public Person(int code) {
_bloodGroup = BloodGroup.code(code);
}

public void setBloodGroupCode(int code) {
_bloodGroup =BloodGroup.code(code);
}

public int getBloodGroupCode() {
return _bloodGroup.getCode();
}
}</pre>

Mục tiêu là làm cho mọi thứ tương tác với BloodGroup nhưng hiện tại bên ngoài vẫn làm việc với kiểu int. Nên tiếp tục thêm các hàm mới như sau:

<pre class="toolbar:2 lang:java decode:true ">class Person {
public static final int O = BloodGroup.O.getCode();
public static final int A = BloodGroup.A.getCode();
public static final int B = BloodGroup.B.getCode();
public static final int AB = BloodGroup.AB.getCode();
private BloodGroup _bloodGroup;

public Person(int code) {
_bloodGroup = BloodGroup.code(code);
}
public Person(BloodGroup bloodGroup) {
_bloodGroup = bloodGroup;
}
public void setBloodGroupCode(int code) {
_bloodGroup =BloodGroup.code(code);
}
public void setBloodGroup(BloodGroup bloodGroup) {
_bloodGroup =bloodGroup;
}
public int getBloodGroupCode() {
return _bloodGroup.getCode();
}
public BloodGroup getBloodGroup() {
return _bloodGroup;
}
}</pre>

Tiếp theo là loại bỏ các thành phần sau: các **static** trong **person**, **Person(int code)**, void **setBloodGroupCode(int code)**, **int getBloodGroupCode()** và hiệu chỉnh lại code client chuyển qua dùng các hàm mới tương đương:

<pre class="toolbar:2 lang:java decode:true ">class Person {
private BloodGroup _bloodGroup;

public Person(BloodGroup bloodGroup) {
_bloodGroup = bloodGroup;
}

public void setBloodGroup(BloodGroup bloodGroup) {
_bloodGroup =bloodGroup;
}

public BloodGroup getBloodGroup() {
return _bloodGroup;
}
}</pre>

Bước cuối đóng private các thành phần bên BloodGroup để không cho bên ngoài tiếp cận với mã bên trong, không thể tạo thêm nhóm máu mới tùy tiện.  
Lúc này thế giới chỉ biết các nhóm máu O,A,B,AB mà không thể biết hay can thiệp vào mã dữ liệu bên trong

<pre class="toolbar:2 lang:java decode:true ">class BloodGroup{
public static final BloodGroup O = new BloodGroup(0);
public static final BloodGroup A = new BloodGroup(1);
public static final BloodGroup B = new BloodGroup(2);
public static final BloodGroup AB = new BloodGroup(3);
public static final BloodGroup[] _values = new BloodGroup[] {O,A,B,AB};
private final int _code;
private BloodGroup(int code) {
_code = code;
}
private int getCode() {
return _code;
}
private static BloodGroup code(int arg) {
return _values[arg];
}

}</pre>

**Còn tiếp**

 [1]: https://blackntt.wordpress.com/2018/07/21/xu-ly-code-smell-primitive-obsession-part-1/