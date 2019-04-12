package com.tests.service;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import java.net.URL;
import java.util.List;
import java.util.Objects;

import org.openqa.selenium.By;
import org.openqa.selenium.Platform;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.remote.DesiredCapabilities;
import org.openqa.selenium.remote.RemoteWebDriver;

@Service
public class SeleniumService {

    private static Logger LOG = LoggerFactory.getLogger(SeleniumService.class);

    public void run(String sutIP, String testServerIP) throws Exception {
		//WebDriver driver = new ChromeDriver();
		WebDriver driver = new RemoteWebDriver(new URL("http://" + testServerIP + ":4444/wd/hub"),
				new DesiredCapabilities("firefox", "", Platform.LINUX));
		
        //driver.get("http://52.53.204.53");
        driver.get("http://" + sutIP);
		
		WebElement maindivelement = driver.findElement(By.className("container"));
		List<WebElement> paras = maindivelement.findElements(By.tagName("p"));
		//System.out.println("Size = " + paras.size() + "   " + paras.toString() );
		if(paras.size() != 1) throw new Exception("More than one paragraph");
		else
		{
			//System.out.println(paras.get(0).getText());
			if(Objects.equals(paras.get(0).getText(), "This is a test message") == false) throw new Exception("Wrong text");
			//if(paras.get(0).getText() != "This is a test message") throw new Exception("Wrong text");
		}
        System.out.println("Testing fine!");
        LOG.info("Testing fine!");
	}

}