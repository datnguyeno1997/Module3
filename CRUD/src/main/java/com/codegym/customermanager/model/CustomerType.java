package com.codegym.customermanager.model;

public class CustomerType {
    private int id;
    private String name;

    public CustomerType(int id, String name) {
        this.id = id;
        this.name = name;
    }

    public CustomerType() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}