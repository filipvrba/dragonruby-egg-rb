# DragonRuby-Egg (CLI)
DragonRuby-Egg is a tool for managing DragonRuby and its modules. With this tool, you can easily create new projects and install modules for your existing projects. Additionally, it offers various commands for working with DragonRuby and its documentation.

**Please note that this repository is now archived and no longer actively maintained.**

## Installation

*To install DragonRuby-Egg, use the following command:*
```bash
gem install dragonruby-egg
```

## Usage
### Creating a new project

*With DragonRuby-Egg, you can easily create new projects. Simply run the following command:*
```bash
dre new [PROJECT_NAME] [PROJECT_PATH]
```

*For example, to create a project named "sandbox" on your desktop, use the following command:*
```bash
dre new sandbox ~/Desktop
```

### Installing modules
DragonRuby-Egg also allows for easy installation of modules into your projects.
*To install a module, use the following command:*
```bash
dre install [MODULE_NAME] [PROJECT_PATH]
```

*For example, to install the "dr-core-rb" module into the "sandbox" project on your desktop, use the following command:*
```bash
dre install dr-core-rb ~/Desktop/sandbox
```

When installing a module, DragonRuby-Egg will prompt for confirmation to ensure that you are certain you want to install the module.

### Other commands

DragonRuby-Egg also offers several additional commands for working with DragonRuby and its documentation.
*You can view a list of commands by running:*

```bash
dre --help
```

### Example module implementation

When creating a new project with DragonRuby-Egg, you can incorporate modules that extend the functionality of DragonRuby. These modules can be installed using the *"dre install"* command and loaded using the *"require"* command in a Ruby script.

Suppose you want to install a module named "my-module" that provides new functions for manipulating game elements.
*After installing this module, you can use its functions like this:*
```ruby
require 'modules/my-module/lib/my-module-1.0.0/my_module.rb'

my_module_function()
```

The above code will load the file *"my_module.rb"* from the directory *"modules/my-module/lib/my-module-1.0.0"* and allow you to use the functions of this module. To install the module, you can use the command *"dre install my-module"*.

Upon completing the installation, DragonRuby-Egg will output a message confirming the module installation, such as: *"The 'my-module' module has been installed in this './modules/my-module' folder."*

> I hope this information helps you better understand how to use DragonRuby-Egg for installing and using modules in DragonRuby projects.

## Note
DragonRuby-Egg was created for use on the Linux operating system. If you are using a different operating system, the application may not function properly.

### Modules
Here you can find all available modules: https://dragonruby-egg-ui-rjs.vercel.app/

> ### Info
> If you want to add your own module to the page, read the [README](https://github.com/filipvrba/dragonruby-egg-ui-rjs/blob/main/README.md).

## Tutorials
- [Usage Tutorial](./docs/usage_tutorial.md)

## Contributors
- [Filip Vrba](https://github.com/filipvrba) - creator and maintainer
