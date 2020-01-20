package org.spinel.glue;

public class SpinelGlue {
    private static native String initialize();
    public String doInitialize() {
        return initialize();
    }
}
