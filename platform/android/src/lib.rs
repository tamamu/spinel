#[cfg(target_os = "android")]
#[allow(non_snake_case)]
pub mod android {
    extern crate jni;

    use self::jni::objects::{JClass, JString};
    use self::jni::sys::jstring;
    use self::jni::JNIEnv;
    use super::*;

    #[no_mangle]
    pub unsafe extern "C" fn Java_org_spinel_glue_SpinelGlue_initialize(
        env: JNIEnv,
        _: JClass,
    ) -> jstring {
        let output = env
            .new_string(format!("Hello, world!"))
            .expect("couldn't create java string");
        output.into_inner()
    }
}

// #[cfg(test)]
// mod tests {
//     #[test]
//     fn it_works() {
//         assert_eq!(2 + 2, 4);
//     }
// }
