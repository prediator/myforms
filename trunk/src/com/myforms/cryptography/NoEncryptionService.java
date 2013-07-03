package com.myforms.cryptography;

import com.myforms.exception.CryptographyException;

public class NoEncryptionService implements EncryptionDecryptionService {

	@Override
	public String encrypt(String string) throws CryptographyException {
		// TODO Auto-generated method stub
		return string;
	}

	@Override
	public String decrypt(String string) throws CryptographyException {
		// TODO Auto-generated method stub
		return string;
	}

}
