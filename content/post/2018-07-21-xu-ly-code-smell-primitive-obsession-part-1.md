---
title: Xử lý code smell Primitive Obsession – Part 1
author: blackntt
type: post
date: 2018-07-21T11:54:59+00:00
url: /xu-ly-code-smell-primitive-obsession-part-1/
timeline_notification:
  - 1532174102
categories:
  - Refactoring
tags:
  - OOP

---
Bài này nói về việc xử lý code smell Primitive Obsession &#8211; Code smell số 9 trong bài về danh sách các dấu hiệu [code smell.][1]

Để hiểu được code smell này đầu tiên biết 2 loại dữ liệu cơ bản trong lập trình OOP: kiểu dữ liệu cơ bản (các kiểu cơ bản như int, double, float, string,&#8230; không phải object) và kiểu object. Code smell Primitive Obserssion thường xuất hiện khi:

  * sử dụng kiểu cơ bản  để biểu diễn các đối tượng mang tính trừu tượng. Ví dụ dùng 1 số double để biểu diễn currency (tiền tệ), chuỗi biểu diễn cho số điện thoại, zipcode chẳng hạn. sử dụng mấy kiểu này cho kiểu trừu tượng đến một lúc nào đó sẽ phát sinh thêm các thao tác xử lý hoặc các dữ liệu kèm thêm. nếu dữ liệu đó lặp lại nhiều nơi dẫn đến việc thao tác xử lý trên nó hoặc dữ liệu cần kèm theo sẽ đi cùng &#8211;> code khó quản lý, việc **duplicate code** là tất yếu.
  * Sử dụng biến, giá trị hằng để biểu diễn cho các thông tin mang tính quy ước. Ví dụ:  const USER_ADMIN = 1

Minh họa các xử lý phần 1, phần 2 sẽ viết tiếp sau:

  * Sử dụng kĩ thuật thay thế giá trị dữ liệu bằng object &#8211;**Replace Data Value With Object:** ![](wp-content/uploads/2018/07/capture.png)



Ta thấy mỗi object của class Order sẽ có thông tin về khách hàng **customer**. thuộc tính **customer** nó có thể sẽ mở rộng khi có thể cần thêm thông tin như ngày sinh, số điện thoại,&#8230; không chỉ đơn thuần là tên. Về cơ bản **customer** có ý nghĩa trừu tượng là khách hàng mà ý nghĩa này người dùng về sau có thể cần thêm nhiều thuộc tính, thao tác có dữ liệu đó. Và ta thấy một điều khi để một thông tin có thể thay đổi trong một class như thế sẽ dẫn đến class Order sẽ thiếu tính ổn định khi phải xử lý cụ thể customer ở kiểu string trong khi nó là kiểu dữ liệu trừu tượng hơn rất nhiều. Điều đó sẽ dẫn đến là class Order không thỏa nguyên tắc **Open/Closed principle** trong bộ nguyên tắc **SOLID.**

Để khắc phục điều này ta có thể sử dụng **Replace Data Value With Object **di chuyển dữ liệu về customer ra một class khác (lúc này ta tùy ý mở rộng, thay đổi mà ý nghĩa ở phía client &#8211; **order** đối với **customer** không thay đổi) và Order sẽ chứa object customer.

```java
Giả sử có 1 mẫu class Order
class Order{
public Order (String customer) {
_customer = customer;
}
public String getCustomer() {
return _customer;
}
public void setCustomer(String arg) {
_customer = arg;
}
private String _customer;
}
```

Xử lý:

Tạo class

```java
class Customer {
public Customer (String name) {
_name = name;
}
public String getName() {
return _name;
}
private final String _name;
}
```

Chỉnh lại class Order:  
Đổi tên (Rename Method) từ _**getCustomer**_ thành _**getCusomterName**_. Đổi tên các đối số cho hợp lí với ngữ cảnh còn về signature của method sẽ giữ nguyên để tránh thay đổi việc sử dụng ở client.

```java
class Order{
public Order (String customerName) {
_customer = new Customer(customer);
}
public String getCustomerName() {
return _customer.getName();
}
private Customer _customer;
public void setCustomer(String customerName) {
_customer = new Customer(customer);
}
```

Lúc này về cơ bản là xong phần refactory nhưng hiện tại **customer** được sử dụng ở lại value object. Tức mỗi **order** sẽ tạo một đối tượng **customer** của riêng nó. Phần tiếp theo có thể thực hiện hoặc không thực hiện tùy thuộc đang làm với đối tượng nào. Nếu đối tượng là dạng như ngày tháng,&#8230; thì không cần làm thêm bước tiếp theo mà chỉ cần để dạng value object là đủ. Trong tình huống này thì cần làm thêm bước tiếp theo vì Mỗi lần cung cấp 1 **customerName** thì mỗi object mới của customer được tạo ra do đó trong tình huống muốn bổ sung thêm các thông tin khác như số điện thoại, &#8230; vào **customer** thì vẫn chưa làm ngay được vì mỗi đối tượng mới tạo ra thì các giá trị khác của đối tượng cũ đã mất. Đồng thời, một **customer** có thể mua chung nhiều order, trong tình huống ta muốn tất các **customer** trong các order của chung một người thì ta cần phải đảm bảo tất **customer** object trong order phải chỉ chung 1 object (giống như trong thực tế, một người có nhiều đơn hàng nhưng người đó chỉ là một chứ không có người số 2 là bản sao của họ cùng tồn tại). lúc này ta cần phải sử dụng kĩ thuật **Change Value to Reference.**

Để thực hiện **Change Value to Reference**

<img class="alignnone size-full wp-image-161" src="/static/wp-content/uploads/2018/07/capture1-e1532148458971.png" alt="capture1.png" width="520" height="280" /> 

Như phân tích ở trên, giờ nhiệm vụ là làm sao để cho các đối tượng **customer** cùng chỉ chung một người sẽ phải tham chiếu đến chung 1 vùng nhớ.

Dùng  **Replace Constructor with Factory Method** (thay hàm khởi tạo bằng **factory method**) để điều khiển việc tạo đối tượng **customer** để class **customer** quản lý hoàn toàn việc tạo ra đối tượng **customer** mà ko để bên ngoài biết và bên ngoài cũng ko cần quan tâm như sau:

Thêm một hàm _**create**_, hàm này có nhiệm vụ nhận là tên khách hàng (giả sử trong bài toàn này không tồn tại 2 khách hàng chung tên, thực tế có thể chỗ này dùng id) trả về tham chiếu đến object của khách hàng có tên được truyền vào.

```java
class Customer {
public static Customer create (String name) {
return new Customer(name);
}
```

Tiếp theo block constructor bằng private (lúc này bên ngoài không tự ý tạo bất kì đối tượng customer mới nào)

```java
class Customer {
private Customer (String name) {
_name = name;
}
```

Khi đó bên class Order sẽ thay đổi các nên tạo object customer thông qua hàm create như sau:

```java
class Order {
public Order (String customer) {
_customer = Customer.create(customer);
}
```

Giờ nhìn lại hàm _**create**_. hàm _**Create**_ hiện tại là mỗi lần gọi _**create**_ là tạo một đối tượng mới lúc này vẫn chưa xử lý được việc để các đối tượng customer giống nhau (cùng tên) sẽ cùng tham chiếu đến 1 vùng nhớ.

Việc đầu tiền là cần một nơi lưu trữ thông các đối tượng **customers** để từ đó dựa vào _**name**_ mà lấy đối tượng hợp lý ra cho người dùng.

Ở đây, ta có thể sử dụng _**Hashtable**_ (hoặc một cấu trúc dữ liệu bất kì có khả năng chứ nhiều đối tượng và truy xuất đối tượng theo key kiểu key-value) để lưu tất cả danh sách các customer. Khi có yêu cầu tạo một customer mới thì từ hàm create thì sẽ load customer theo tên (như là key) từ hashtable

```java
class Customer {
private static Dictionary _instances = new Hashtable();

static void loadCustomers() {
new Customer ("Lemon Car Hire").store();
new Customer ("Associated Coffee Machines").store();
new Customer ("Bilston Gasworks").store();
}
private void store() {
_instances.put(this.getName(), this);
}
```

hàm _**loadCustomers**_ giả lập tạo sẵn các **customers** hợp lê vào thêm vào _**_instances**_. _**loadCustomers**_ sau này có thể thay thế cho các nguồn lưu trữ dữ liệu customer khách (ví dụ load danh sách customer từ file, từ cơ sỡ dữ liệu,&#8230;)

hàm _**store**_ sẽ lưu **customer** vào bảng _**_instances**_ để tái truy xuất. Về cơ bản đến bước này là factory xong. Việc đơn giản cuối cùng là sử dụng **Rename Method** chỉnh lại tên hàm _**create**_ thành _**getNamed **_để khớp với nội dung.

```java
class Customer{
public static Customer getNamed (String name) {
return (Customer) _instances.get(name);
}
```

**Kết quả xong phát trình refactory**

<img class="alignnone size-full wp-image-174" src="/static/wp-content/uploads/2018/07/untitled.png" alt="Untitled.png" width="601" height="315" />

 [1]: https://blackntt.wordpress.com/2018/07/20/cac-dau-hieu-nhan-biet-code-khong-on-code-smells-can-phai-tai-cau-truc-ngay-refactoring/