package com.walletapp.demo.constants;

public abstract class Message {
    private Message() {
        /* This utility class should not be instantiated */
    }

    public static final String USER_NOT_FOUND = "User not found.";
    public static final String EXPENSE_NOT_FOUND = "Expense not found.";
    public static final String INCOME_NOT_FOUND = "Income not found.";
    public static final String CATEGORY_NOT_FOUND = "Category not found.";
    public static final String GROUP_NOT_FOUND = "Group not found.";
    public static final String PAYMENT_METHOD_NOT_FOUND = "Payment method not found.";

    public static final String USERNAME_UPDATED = "Username successfully updated.";
    public static final String FULLNAME_UPDATED = "Fullname successfully updated.";
    public static final String PHONE_NUMBER_UPDATED = "Fullname successfully updated.";
    public static final String BIRTH_UPDATED = "Date of birth successfully updated.";
    public static final String ADDRESS_UPDATED = "Address successfully updated.";
    public static final String EMAIL_UPDATED = "Email successfully updated.";
    public static final String COUNTRY_UPDATED = "Country successfully updated.";
    public static final String DEFAULT_CURRENCY_UPDATED = "Default currency successfully updated.";

    public static final String COMMERCE_MANDATORY = "The field commerce is mandatory.";
    public static final String AMOUNT_MANDATORY = "The field amount is mandatory.";
    public static final String AMOUNT_NO_NEGATIVE = "The amount can't be a negative value.";
    public static final String CURRENCY_MANDATORY = "The field currency is mandatory.";
    public static final String DESCRIPTION_MANDATORY = "Please, add a short description.";

}
