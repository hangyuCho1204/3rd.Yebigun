package com.secretcode;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;



public class Encryption {
	private String userPassword;

   
    public boolean encryption(String userPassword) {
        MessageDigest md;
        boolean isSuccess;
        String tempPassword = "";

        try {
            md = MessageDigest.getInstance("SHA-512");

            md.update(userPassword.getBytes());
            byte[] mb = md.digest();
            for (int i = 0; i < mb.length; i++) {
                byte temp = mb[i];
                String s = Integer.toHexString(new Byte(temp));
                while (s.length() < 2) {
                    s = "0" + s;
                }
                s = s.substring(s.length() - 2);
                tempPassword += s;
            }
            setPassword(tempPassword);
            isSuccess = true;
        } catch (NoSuchAlgorithmException e) {
            isSuccess = false;
            return isSuccess;
        }
        return isSuccess;
    }

    private void setPassword(String temppassword) {
        this.userPassword = temppassword;
    }

    public String getPassword() {
        return userPassword;
    }

}
