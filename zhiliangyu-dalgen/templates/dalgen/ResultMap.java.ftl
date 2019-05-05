<@pp.dropOutputFile />
<#list dalgen.resultMaps as resultMap>
    <@pp.changeOutputFile name = "/main/java/${resultMap.classPath}/${resultMap.className}.java" />
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

package ${resultMap.packageName};

import java.io.Serializable;
<#list resultMap.importLists as import>
import ${import};
</#list>

/**
 * The table ${resultMap.desc!resultMap.className}
 * 注意:此结构有系统生成,禁止手工修改,以免被覆盖,请通过dalgen生成
 */
public class ${resultMap.className} implements Serializable {

    private static final long serialVersionUID = -1L;

    <#list resultMap.fieldsList as fields>

    /**
     * ${fields.name} ${fields.desc!}.
     */
    private ${fields.javaType} ${fields.name};
    </#list>
    <#list resultMap.fieldsList as fields>

    /**
     * Set ${fields.name} ${fields.desc!}.
     */
    public void set${fields.name?cap_first}(${fields.javaType} ${fields.name}) {
        this.${fields.name} = ${fields.name};
    }

    /**
     * Get ${fields.name} ${fields.desc!}.
     *
     * @return the ${fields.javaType}
     */
    public ${fields.javaType} get${fields.name?cap_first}() {
        return ${fields.name};
    }
    </#list>
}
</#list>
