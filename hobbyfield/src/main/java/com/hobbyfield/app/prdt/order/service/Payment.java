package com.hobbyfield.app.prdt.order.service;

import lombok.Data;

@Data
public class Payment {
    private String accessToken;
    private String impUid;
    private String amount;

}
