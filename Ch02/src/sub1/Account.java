package sub1;

import java.io.IOException;

import javax.servlet.jsp.JspWriter;

public class Account {
	
	private String bank;
	private String id;
	private String name;
	private int money;
	
	public Account(String bank, String id, String name, int money) {
		this.bank=bank;
		this.id=id;
		this.name=name;
		this.money=money;
	}

	
	public void deposit(int money) {
		this.money+=money;
	}
	public void withdraw(int money) {
		this.money-=money;
	}
	public void show(JspWriter out) throws Exception {
		out.println("<h4>�����ܾ�</h4>");
		out.println("<p>");
		out.println("����� : "+bank+"</br>");
		out.println("���¹�ȣ : "+id+"</br>");
		out.println("�Ա��� : "+name+"</br>");
		out.println("�����ܾ� : "+money+"</br>");
		out.println("</p>");
	}
	public String getBank() {
		return bank;
	}
	public String getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public int getMoney() {
		return money;
	}
	

}
