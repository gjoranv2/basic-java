package gjoranv;

import org.junit.Test;

import static org.junit.Assert.assertEquals;

/**
 * @author gjoranv
 */
public class HelloWorldTest {

    @Test
    public void message_is_produced() {
        assertEquals("Hello, World!", new HelloWorld().message());
    }

}
