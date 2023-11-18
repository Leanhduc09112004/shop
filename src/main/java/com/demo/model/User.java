package com.demo.model;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Data;

@Data
@Entity
@Table(name = "Users")
public class User {
@Id String username;
String password;
String fullname;
Boolean isadmin;
Boolean isstaff;
}
