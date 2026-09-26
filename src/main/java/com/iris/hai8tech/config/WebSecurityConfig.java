package com.iris.hai8tech.config;

import com.iris.hai8tech.service.impl.CustomUserDetailsService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {

    @Autowired
    private CustomUserDetailsService customUserDetailsService;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth)
            throws Exception {

        auth.userDetailsService(customUserDetailsService)
                .passwordEncoder(passwordEncoder());
    }

    @Override
    protected void configure(HttpSecurity http)
            throws Exception {

        http.csrf().disable()
                .authorizeRequests()

                .antMatchers(
                        "/",
                        "/trang-chu",
                        "/login",
                        "/error",
                        "/resource/**",
                        "/api/**"
                )
                .permitAll()

                .antMatchers("/admin/**")
                .hasAnyRole("MANAGER", "STAFF", "ADMIN")

                .anyRequest()
                .authenticated()

                .and()

                .formLogin()
                .loginPage("/login")
                .usernameParameter("j_username")
                .passwordParameter("j_password")
                .loginProcessingUrl("/j_spring_security_check")
                .defaultSuccessUrl("/trang-chu", true)
                .failureUrl("/login?incorrectAccount")
                .permitAll()

                .and()

                .logout()
                .logoutUrl("/logout")
                .logoutSuccessUrl("/trang-chu")
                .deleteCookies("JSESSIONID")
                .permitAll()

                .and()

                .exceptionHandling()
                .accessDeniedPage("/access-denied")

                .and()

                .sessionManagement()
                .maximumSessions(1)
                .expiredUrl("/login?sessionTimeout");
    }
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) {
////        auth.authenticationProvider(authenticationProvider());
//    }
//
////    @Bean
////    public AuthenticationSuccessHandler myAuthenticationSuccessHandler() {
////        return null;
//////        return new CustomSuccessHandler();
////    }
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//        http.csrf().disable()
//                .authorizeRequests()
//                // .antMatchers("/admin/building-edit").hasAnyRole("MANAGER")
//                .antMatchers("/admin/**").hasAnyRole("MANAGER", "STAFF", "ADMIN")
//                .antMatchers("/login", "/resource/**", "/trang-chu", "/api/**").permitAll()
//                .and()
//                .formLogin().loginPage("/login").usernameParameter("j_username").passwordParameter("j_password").permitAll()
//                .loginProcessingUrl("/j_spring_security_check")
//                .defaultSuccessUrl("/trang-chu", true)
////                .successHandler(myAuthenticationSuccessHandler())
//                .failureUrl("/login?incorrectAccount").and()
//                .logout().logoutUrl("/logout").deleteCookies("JSESSIONID")
//                .and().exceptionHandling().accessDeniedPage("/access-denied").and()
//                .sessionManagement().maximumSessions(1).expiredUrl("/login?sessionTimeout");
//    }
}
