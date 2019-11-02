package com.xbb.blog.config;

import org.apache.ibatis.session.Configuration;
import org.mybatis.spring.boot.autoconfigure.ConfigurationCustomizer;
import org.springframework.context.annotation.Bean;

/**
 * @author Administrator
 * @title: MyBatisConfig
 * @projectName spring-boot-web-03
 * @description: TODO
 * @date 2019\6\9 000921:06
 */
@org.springframework.context.annotation.Configuration
public class MyBatisConfig {

    @Bean
    public ConfigurationCustomizer configurationCustomizer(){
        return new ConfigurationCustomizer(){
            @Override
            public void customize(Configuration configuration) {
                // 开启驼峰命名
                configuration.setMapUnderscoreToCamelCase(true);
            }
        };
    }
}
