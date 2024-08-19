package com.example.shopping;

public class Item {
	private String name;
	private int quantity;
	private double price;

	public Item(String name, int quantity, double price) {
		this.name = name;
		this.quantity = quantity;
		this.price = price;
	}

	// Getter methods
	public String getName() {
		return name;
	}

	public int getQuantity() {
		return quantity;
	}

	public double getPrice() {
		return price;
	}
}
