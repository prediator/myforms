package com.myforms.racf.service;

import com.myforms.racf.AccessType;
import com.myforms.racf.Racf;

public interface RacfService {
	public AccessType getAccessTypeByName(String accesType);
	public void saveRacf(Racf racf);
}
