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

package cn.ttzero.zhiliangyu.about;

import cn.ttzero.zhiliangyu.AbstractTest;
import cn.ttzero.zhiliangyu.dal.zly.dataobject.TestDO;
import org.junit.Test;
import org.springframework.http.MediaType;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;

import static org.junit.Assert.assertEquals;
import static cn.ttzero.zhiliangyu.Print.println;

/**
 * Create by guanquan.wang at 2019-04-25 16:31
 */
public class AboutControllerTest extends AbstractTest {
    @Test
    public void testInit() throws Exception {
        String uri = "/about";
        MvcResult mvcResult = mvc.perform(MockMvcRequestBuilders.get(uri)
            .accept(MediaType.APPLICATION_JSON_VALUE)).andReturn();

        int status = mvcResult.getResponse().getStatus();
        assertEquals(200, status);
        String content = mvcResult.getResponse().getContentAsString();

        println(content);
    }

    @Test
    public void testGetById() throws Exception {
        String uri = "/about/1";
        MvcResult mvcResult = mvc.perform(MockMvcRequestBuilders.get(uri)
            .accept(MediaType.APPLICATION_JSON_VALUE)).andReturn();

        int status = mvcResult.getResponse().getStatus();
        assertEquals(200, status);
        String content = mvcResult.getResponse().getContentAsString();

        println(content);

        TestDO testDO = super.mapFromJson(content, TestDO.class);
        assertEquals(testDO.getName(), System.getProperty("user.name"));
    }
}
