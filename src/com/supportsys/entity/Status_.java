package com.supportsys.entity;

import javax.annotation.Generated;
import javax.persistence.metamodel.ListAttribute;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2017-10-16T21:46:52.121-0200")
@StaticMetamodel(Status.class)
public class Status_ {
	public static volatile SingularAttribute<Status, Integer> id;
	public static volatile SingularAttribute<Status, String> name;
	public static volatile ListAttribute<Status, Help> helps;
}
