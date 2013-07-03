package com.myforms.cryptography;

import com.myforms.exception.CryptographyException;

public interface EncryptionDecryptionService {
	/**
	 * 
	 * @return
	 */
public String encrypt(String string) throws CryptographyException;
/**
 * 
 * @param string
 * @return
 */
public String decrypt(String string) throws CryptographyException;
}
