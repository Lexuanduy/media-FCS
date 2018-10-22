package net.test;

import com.googlecode.objectify.annotation.Entity;
import com.googlecode.objectify.annotation.Id;
import com.googlecode.objectify.annotation.Index;

@Entity
public class Files {
	@Id
	private String id;
	@Index
	private String fbid;
	
	public Files() {
	}

	public Files(String id, String fbid) {
		super();
		this.id = id;
		this.fbid = fbid;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getFbid() {
		return fbid;
	}

	public void setFbid(String fbid) {
		this.fbid = fbid;
	}
}