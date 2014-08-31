package com.wali.smdiary.dao;

import java.io.Serializable;

public interface ISmDiaryAdminDao<T, ID extends Serializable>
{

	Boolean doSave(Serializable T);

}
