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

package cn.ttzero.zhiliangyu.runner;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Create by guanquan.wang at 2019-04-25 15:31
 */
@Component
public class CreateTableRunner implements CommandLineRunner {
    private Logger logger = LogManager.getLogger(getClass());

    @Autowired
    private DataSource dataSource;

    @Override
    public void run(String... args) throws Exception {
        try (Connection con = dataSource.getConnection()) {
            logger.info("create table test.");

            PreparedStatement statement = con.prepareStatement("CREATE TABLE IF NOT EXISTS test (" +
                "id integer primary key AUTO_INCREMENT," +
                "`name` varchar(50))");
            statement.executeUpdate();
        }

        installData();
    }

    /**
     * Insert
     */
    private void installData() throws SQLException {
        String name = System.getProperty("user.name");
        try (Connection con = dataSource.getConnection()) {
            logger.info("create table test.");

            PreparedStatement statement = con.prepareStatement("select id from test where name = ?");
            statement.setString(1, name);
            ResultSet rs = statement.executeQuery();
            if (!rs.next()) {
                statement = con.prepareStatement("insert into test(`name`) values (?)");
                statement.setString(1, name);
                statement.executeUpdate();
            }
        }
    }
}
