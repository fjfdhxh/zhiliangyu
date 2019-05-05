/*
 * MIT License
 *
 * Copyright (c) 2019 guanquan.wang@yandex.com All Rights Reserved.
 * Copyright (c) 2019 huanghui7635@126.com All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in all
 * copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
 * SOFTWARE.
 */

package cn.ttzero.zhiliangyu;

public class Print {

	public static void print(boolean b) {
		System.out.print(b);
	}

	public static void print(char c) {
		System.out.print(c);
	}

	public static void print(int i) {
		System.out.print(i);
	}

	public static void print(long l) {
		System.out.print(l);
	}

	public static void print(float f) {
		System.out.print(f);
	}

	public static void print(double d) {
		System.out.print(d);
	}

	public static void print(char[] s) {
		System.out.print(s);
	}

	public static void print(String s) {
		System.out.print(s);
	}

	public static void print(Object o) {
		System.out.print(o);
	}

	public static void println() {
		System.out.println();
	}

	public static void println(boolean b) {
		System.out.println(b);
	}

	public static void println(char c) {
		System.out.println(c);
	}

	public static void println(int i) {
		System.out.println(i);
	}

	public static void println(long l) {
		System.out.println(l);
	}

	public static void println(float f) {
		System.out.println(f);
	}

	public static void println(double d) {
		System.out.println(d);
	}

	public static void println(char[] s) {
		System.out.println(s);
	}

	public static void println(String s) {
		System.out.println(s);
	}

	public static void println(Object o) {
		System.out.println(o);
	}

	public static void hexString(byte[] bytes) {
		for (int i = 0; i < bytes.length; ) {
			System.out.print(Integer.toHexString(bytes[i] & 0xff));
			System.out.print(' ');
			if (++i % 64 == 0) {
				System.out.println();
			}
		}
	}

	public static void hexString(int offset, int size, byte[] bytes) {
		for (int i = 0; i < size; ) {
			System.out.print(Integer.toHexString(bytes[i + offset] & 0xff));
			System.out.print(' ');
			if (++i % 64 == 0) {
				System.out.println();
			}
		}
	}

	public static void println(byte[] bytes) {
		for (int i = 0; i < bytes.length; ) {
			System.out.print(bytes[i]);
			System.out.print(' ');
			if (++i % 64 == 0) {
				System.out.println();
			}
		}
	}

	public static void println(int offset, int size, byte[] bytes) {
		for (int i = 0; i < size; ) {
			System.out.print(bytes[i + offset]);
			System.out.print(' ');
			if (++i % 64 == 0) {
				System.out.println();
			}
		}
	}
}
