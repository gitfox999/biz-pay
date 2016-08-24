package com.util;

public class Person {
	public Person(String asdf,int age,int height){
		name = asdf;
		age = age;
		height = height;
	}
	
	public String name;
	public int age;
	public int height;
	
	public static void main(String[] args) {
		Person pp = new Person("asdf",23,177);
//		pp.name = "zhangsan";
//		pp.age = 23;
//		pp.height = 177;
	}
}
