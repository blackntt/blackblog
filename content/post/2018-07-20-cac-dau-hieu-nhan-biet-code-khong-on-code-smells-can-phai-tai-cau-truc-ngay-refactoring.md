---
title: Các dấu hiệu (Code smells) nhận biết code không ổn cần phải tái cấu trúc ngay (Refactoring)
author: blackntt
type: post
date: 2018-07-20T11:57:00+00:00
url: /cac-dau-hieu-nhan-biet-code-khong-on-code-smells-can-phai-tai-cau-truc-ngay-refactoring/
timeline_notification:
  - 1532087827
categories:
  - Refactoring
tags:
  - Code smells
  - OOP

---
Sau đây là một số dấu hiệu mà chắc một lập trình viên hướng đối tượng cũng sẽ gặp phải không phải một lần mà nhiều lần nhưng lại không biết nó là dấu hiệu cho thấy đoạn code của mình đang bị bệnh. Các dấu hiệu code tệ đó gọi là các **code smells.**

Bài viết sẽ giới thiệu một số dấu hiệu của các đoạn code tệ được **Martin Fowler** trình bày trong cuốn sách về Refactory.

Chi tiết các phương pháp giải quyết cho từng trường hợp sẽ viết ở các bài sau. Toàn bộ kĩ thuật Refactory cơ bản có thể tham khảo từ cuốn sách kinh điển của **Martin Fowler** &#8211; **Refactoring: Improving the Design of Existing Code.**

Các code smells cơ bản (các từ tiếng anh im đậm là tên của code smells mà các lập trình viên dùng để gọi cho triệu chứng -có thể dựa vào nó mà search):

  1.  Các đoạn code nào đó cùng cấu trúc bị lặp lại. Đoạn code đó tốt nhất là nên đặt ở một nơi hơn là nằm nhiều vị trí khác nhau. Điều này sẽ có lợi cho việc tái sử dụng về sau, cũng như khoan vùng phạm vị nếu có bug, chi phí bảo trì lợi hơn khi chỉ thực hiện ở một nơi. (**Duplicated code**)
  2. Hàm quá dài &#8211; hàm càng dài càng khó khăn cho việc đọc hiểu. Code đoạn khó hiểu thì tất nhiên tìm lỗi, fix lỗi, đảm bảo tính đúng hay bảo trì luôn khó khăn hơn. (**Long Method**)
  3. Class quá lớn. Bên trong một class code quá nhiều thì việc tìm ẩn duplicated code, Long Method là tất yếu. Chưa kể nội dung class có thể bị hiệu chỉnh thay đổi liên tục thiếu tính ổn định khi yêu cầu nào đó của chức năng nó nhận bị thay đổi và điều này có thể làm ảnh hưởng đến những nơi sử dụng các chức năng không liên quan . (**Large Class**)
  4. Danh sách tham số của hàm nhiều (**Long Parameter List**)
  5. Một class có thể bị thay đổi theo nhiều hướng khác nhau. Class này sẽ thay đổi 3 phương thức này nếu nghiệp vụ này xảy ra. Class sẽ thay đổi 5 phương thức kia nếu nghiệp vụ kia xảy ra. Lúc này nên tách ra các class khác nhau để class đó chỉ thay đổi khi nghiệp vụ chính của nó thay đổi. &#8211; **Divergent Change**
  6. Khi nào đang muốn thay đổi một chỗ mà từ chỗ đó cần phải thực hiện 1 đống thay đổi nhỏ ở 1 đống chỗ khác, class khác. Cái này sẽ khác với Divergent Change- **Shortgun surgery**
  7. Một hàm lại sử dụng đồ (thuộc tính,..) của class ngoài nhiều hơn là class của mình &#8211; **Feature Envy**
  8. Trong class có một nhóm các field thường đi chung với nhau, trong các phương pháp có một số tham số thường đi chung với nhau &#8211; **Data clump**
  9. Sử dụng các kiểu dữ liệu cơ bản để biểu diễn cho các đối tượng có ý nghĩa &#8211; **Primitive Obsession**
 10. Câu lệnh switch phân tán chương trình ở nơi khác nhau. Khi một trường hợp của switch được thêm vào thì phải tìm tất cả các chỗ chứa khố lệnh switch đó mà thêm vào cho đủ các trường hợp. Việc này đòi hỏi chi phí, với tỉ lệ để lại lỗi cao &#8211; **Switch Statements**
 11. Tạo một subclass (class con) ở class này phải tạo thêm các subclasses ở các nhóm class khác cho đồng bộ &#8211; **Parallel Inheritance Hierarchies**
 12. Một class ít được sử dụng, ko đáng để bảo trì &#8211; **Lazy class**
 13. Nhiều hook, nhiều case dự phòng được viết cho các trường hợp nghĩ là sẽ dùng trong tương lai &#8211; **Speculative Generality**
 14. Các field của class chứa dữ liệu tạm thời và chỉ sử dụng trong một vài ngữ cảnh cụ thể. Ví dụ vì ngại việc truyền tham số nên đã tạo ra hàng loạt các biến ở class nhưng biến đó chỉ sử dụng đúng cho phương thức đó còn phương thức khác không sử dụng. Trong khi dữ liệu của class cần phải là dữ liệu được sử dụng thường xuyên và có ý nghĩa ở nhiều ngữ cảnh của class &#8211; **Temporary Field**
 15. Để gọi hành vi hay lấy dữ liệu của một đối tượng mà phải thực hiện một chuỗi liên tiếp gọi đến nhiều đối tượng khác nhau (ví dụ: a.callB().callC().callD().doAction() &#8230;. &#8211; **Message Chain**
 16. Class không làm gì mà toàn ủy thác chức năng sang các class khác. Ví dụ class A có hàm B. Trong hàm B thì class A không làm chức năng gì cả mà chuyển nhiệm vụ sang class C &#8211; **Middle Man**
 17. Một class, phương thức truy cập quá nhiều đến các thuộc tính, phương pháp của class khác hơn là của mình &#8211; **Inappropriate Intimacy**
 18. Các class khác nhau làm nhiệm vụ giống nhau nhưng cấu trúc hàm lại khác nhau &#8211; **Alternative Classes with Different Interfaces**
 19. Các thư viện không đáp ứng được yêu cầu cần thiết &#8211; **Incomplete Library Class**
 20. Các class chỉ chứ dữ liệu với các phương thức getter, setter hoặc không chứa tính năng hoặc không có tính năng xử lý độc lập &#8211; **Data Class**
 21. Một class kế thừa từ một class. Nhưng no không thực sự có quan hệ với parent class của nó mà chỉ đơn giản gọi sử dụng 1 vài thuộc tính, phương thức còn các thành phần khác thì bỏ trống không quan tâm, không liên quan &#8211; **Refused Bequest**
 22. Có quá nhiều comments &#8211; tức code có thể chưa đủ clear, dễ dàng đọc hiểu &#8211; **Comments**