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

package cn.ttzero.zhiliangyu.dal.zly.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import cn.ttzero.zhiliangyu.dal.zly.dataobject.TestDO;
import cn.ttzero.zhiliangyu.dal.zly.mapper.TestDOMapper;

/**
* The Table TEST.
* 注意:此结构有系统生成,禁止手工修改,以免被覆盖,请通过dalgen生成
* TEST
*/
@Repository
public class TestDAO {

    @Autowired
    private TestDOMapper testDOMapper;

    /**
     * 插入表:TEST.
     * @param entity entity
     * @return Long
     */
    public Long insert(TestDO entity) {
        return testDOMapper.insert(entity);
    }

    /**
     * 根据主键获取数据:TEST.
     * @param id id
     * @return TestDO
     */
    public TestDO getByPrimary(Integer id) {
        return testDOMapper.getByPrimary(id);
    }
}
