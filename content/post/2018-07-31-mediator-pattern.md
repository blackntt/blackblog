---
title: Mediator Pattern
author: blackntt
type: post
date: 2018-07-31T15:50:52+00:00
url: /mediator-pattern/
categories:
  - Design Pattern

---
Mediator  pattern là pattern cho phép giảm việc coupling bằng việc đóng gói cách giao tiếp của tập các objects khác nhau tưởng tác, giao tiếp với nhau.

Ta sử dụng Mediator khi giao tiếp giữa các objects trong hệ thống quá phức tạp, có quá nhiều quan hệ giữa các objects trong hệ thống.

Các bước xây dựng Mediator:

  * Xây dựng 1 class riêng đóng vài trò Mediator gom các tương tác giữ các class lại
  * Các class khác ủy quyền các thao tác đến Mediator và không có thao tác trựa tiếp

Sơ đồ minh họa:

<img class="aligncenter" src="https://upload.wikimedia.org/wikipedia/commons/9/92/W3sDesign_Mediator_Design_Pattern_UML.jpg" /> 

Mediator được sử dụng cũng khá nhiều. Thường được thấy ở các ứng dụng liên quan đến chat như _Facebook__ hay Java Message Service._

Một ví dụ minh họa về Mediator.

Trong một ứng dụng chát, một cá nhân sẽ có thể send và recieve message. Khi một người muốn send message đến group thì người đó phải tìm xem tất cả những người đang online hoặc trong trạng thái có thể message để send. Nếu bình thường người gửi tin phải tự làm hết mọi thứ, phải tự kiểm tra từ cá nhân và thực hiện việc gửi tin nhắn.

Khi sử dụng Mediator: cá nhân không cần tự kiểm tra, quan tâm ai có thể nhận message mà gửi. cá nhân chỉ việc gửi thông tin đến Mediator của group. Mediator sẽ tự điều phối message này đến người nhận.

<pre class="toolbar:2 show-plain:3 lang:java decode:true">public interface Mediator {
  public void send(String message, Colleague colleague);
}</pre>

<pre class="toolbar:2 lang:java decode:true">//Colleage interface
public abstract Colleague{
  private Mediator mediator;
  public Colleague(Mediator m) {
    mediator = m;
  }
  //send a message via the mediator
  public void send(String message) {
    mediator.send(message, this);
  }
  //get access to the mediator
  public Mediator getMediator() {return mediator;}
  public abstract void receive(String message);
}</pre>

<pre class="toolbar:2 lang:java decode:true ">public class ApplicationMediator implements Mediator {
  private ArrayList&lt;Colleague&gt; colleagues;
  public ApplicationMediator() {
    colleagues = new ArrayList&lt;Colleague&gt;();
  }
  public void addColleague(Colleague colleague) {
    colleagues.add(colleague);
  }
  public void send(String message, Colleague originator) {
    //let all other screens know that this screen has changed
    for(Colleague colleague: colleagues) {
      //don't tell ourselves
      if(colleague != originator) {
        colleage.receive(message);
      }
    }
  }
}</pre>

<pre class="toolbar:2 show-plain:3 lang:java decode:true">public class ConcreteColleague extends Colleague {
  public void receive(String message) {
    System.out.println("Colleague Received: " + message);
  }
}
</pre>

<pre class="toolbar:2 lang:java decode:true ">public class MobileColleague extends Colleague {
  public void receive(String message) {
    System.out.println("Mobile Received: " + message);
  }
}</pre>

<pre class="toolbar:2 lang:java decode:true ">public class Client {
  public static void main(String[] args) {
    ApplicationMediator mediator = new ApplicationMediator();
    ConcreteColleague desktop = new ConcreteColleague(mediator);
    ConcreteColleague mobile = new MobileColleague(mediator);
    mediator.addColleague(desktop);
    mediator.addColleague(mobile);
    desktop.send("Hello World");
    mobile.send("Hello");
  }
}</pre>

<p style="text-align: right;">
  <em>Ví dụ minh họa trích <a href="https://dzone.com/articles/design-patterns-mediator">dzone</a></em>
</p>