package model;
import java.sql.Timestamp;
public class BookingData {
 int bookingId;
 int userId;
 String recName;
 String recAddress;
 String recPin;
 String recMobile;
 int parWeightgm;
 String parContentDescription;
 String parDeliveryType;
 String parPackingPreference;
 Timestamp parPickupTime;
 Timestamp parDropoffTime;
 Double cost;
 Timestamp parPaymentTime;
 String status;

public BookingData(int bookingId, int userId, String recName, String recAddress, String recPin, String recMobile,
		int parWeightgm, String parContentDescription, String parDeliveryType, String parPackingPreference,
		Timestamp parPickupTime, Timestamp parDropoffTime, Double cost, Timestamp parPaymentTime, String status) {
	
	this.bookingId = bookingId;
	this.userId = userId;
	this.recName = recName;
	this.recAddress = recAddress;
	this.recPin = recPin;
	this.recMobile = recMobile;
	this.parWeightgm = parWeightgm;
	this.parContentDescription = parContentDescription;
	this.parDeliveryType = parDeliveryType;
	this.parPackingPreference = parPackingPreference;
	this.parPickupTime = parPickupTime;
	this.parDropoffTime = parDropoffTime;
	this.cost = cost;
	this.parPaymentTime = parPaymentTime;
	this.status = status;
}
public BookingData(int userId, String recName, String recAddress, String recPin, String recMobile,
		int parWeightgm, String parContentDescription, String parDeliveryType, String parPackingPreference,
		Timestamp parPickupTime, Timestamp parDropoffTime,Double cost) {
	
	
	this.userId = userId;
	this.recName = recName;
	this.recAddress = recAddress;
	this.recPin = recPin;
	this.recMobile = recMobile;
	this.parWeightgm = parWeightgm;
	this.parContentDescription = parContentDescription;
	this.parDeliveryType = parDeliveryType;
	this.parPackingPreference = parPackingPreference;
	this.parPickupTime = parPickupTime;
	this.parDropoffTime = parDropoffTime;
	this.cost = cost;
}

public int getBookingId() {
	return bookingId;
}

public int getUserId() {
	return userId;
}

public String getRecName() {
	return recName;
}
public void setRecName(String recName) {
	this.recName = recName;
}
public String getRecAddress() {
	return recAddress;
}
public void setRecAddress(String recAddress) {
	this.recAddress = recAddress;
}
public String getRecPin() {
	return recPin;
}
public void setRecPin(String recPin) {
	this.recPin = recPin;
}
public String getRecMobile() {
	return recMobile;
}
public void setRecMobile(String recMobile) {
	this.recMobile = recMobile;
}
public int getParWeightgm() {
	return parWeightgm;
}

public String getParContentDescription() {
	return parContentDescription;
}

public String getParDeliveryType() {
	return parDeliveryType;
}

public String getParPackingPreference() {
	return parPackingPreference;
}

public Timestamp getParPickupTime() {
	return parPickupTime;
}

public Timestamp getParDropoffTime() {
	return parDropoffTime;
}
public void setParDropoffTime(Timestamp parDropoffTime) {
	this.parDropoffTime = parDropoffTime;
}
public Double getCost() {
	return cost;
}

public String getStatus() {
	return status;
}

public void setStatus(String status) {
	this.status = status;
}

public Timestamp getParPaymentTime() {
	return parPaymentTime;
}

 
 
}