// contains the module API
#include <linux/module.h>

/// contains the init and exit macros
#include <linux/init.h>

/// if needed: base types, functions, macros...
#include <linux/kernel.h>

MODULE_DESCRIPTION("Hello world module");
MODULE_AUTHOR("mastermakrela");
MODULE_LICENSE("GPL");

static int __init hello_init(void)
{
	pr_info("Hello World!\n");

	return 0;
}
module_init(hello_init);

static void __exit hello_exit(void)
{
	pr_info("Goodbye World...\n");
}
module_exit(hello_exit);
