package com.supportsys.entity;

import java.util.Date;
import javax.annotation.Generated;
import javax.persistence.metamodel.SingularAttribute;
import javax.persistence.metamodel.StaticMetamodel;

@Generated(value="Dali", date="2017-10-16T21:46:52.109-0200")
@StaticMetamodel(ChatHelp.class)
public class ChatHelp_ {
	public static volatile SingularAttribute<ChatHelp, Integer> id;
	public static volatile SingularAttribute<ChatHelp, Date> date;
	public static volatile SingularAttribute<ChatHelp, Integer> idUserPost;
	public static volatile SingularAttribute<ChatHelp, String> txt;
	public static volatile SingularAttribute<ChatHelp, Help> help;
}
