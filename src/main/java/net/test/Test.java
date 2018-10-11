package net.test;

import java.math.BigInteger;
import java.util.Base64;

import com.google.common.primitives.Longs;

public class Test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		long now = System.currentTimeMillis();
		now=now/1000;
		System.out.println(now);
		String id = Long.toString(now, Character.MAX_RADIX);
		System.out.println(id);
		
	}

}
