# DragonRuby-Egg (CLI)

DragonRuby-Egg je nástroj pro správu DragonRuby a jeho modulů. Pomocí tohoto nástroje můžete snadno vytvářet nové projekty a instalovat moduly pro vaše existující projekty. Navíc vám nabízí různé příkazy pro práci s DragonRuby a jeho dokumentací.

## Instalace

Pro instalaci DragonRuby-Egg použijte příkaz:
```bash
gem install dragonruby-egg
```

## Použití
### Vytvoření nového projektu

Pomocí DragonRuby-Egg můžete snadno vytvářet nové projekty. Stačí spustit následující příkaz:
```bash
dre new [PROJECT_NAME] [PROJECT_PATH]
```

Například, pro vytvoření projektu s názvem "sandbox" na ploše použijte následující příkaz:
```bash
dre new sandbox ~/Desktop
```

### Instalace modulů
DragonRuby-Egg také umožňuje snadnou instalaci modulů do vašich projektů. Pro instalaci modulu použijte následující příkaz:
```bash
dre install [MODULE_NAME] [PROJECT_PATH]
```

Například, pro instalaci modulu "dr-core-rb" do projektu "sandbox" na ploše použijte následující příkaz:
```bash
dre install dr-core-rb ~/Desktop/sandbox
```

Při instalaci modulu vás DragonRuby-Egg požádá o potvrzení, aby se zajistilo, že jste si jisti, že chcete daný modul nainstalovat.

### Ostatní příkazy

DragonRuby-Egg nabízí také několik dalších příkazů pro práci s DragonRuby a jeho dokumentací. Seznam příkazů můžete zobrazit pomocí příkazu:
```bash
dre --help
```

### Příklad implementace modulu
Při vytváření nového projektu s DragonRuby-Egg můžete začlenit moduly, které rozšiřují funkčnost DragonRuby. Tyto moduly mohou být nainstalovány pomocí příkazu "dre install" a načteny pomocí "require" příkazu v Ruby skriptu.

Předpokládejme, že chcete nainstalovat modul jménem "my-module", který poskytuje nové funkce pro manipulaci s herními prvky. Po nainstalování tohoto modulu, můžete využít jeho funkce takto:
```ruby
require 'modules/my-module/lib/my-module-1.0.0/my_module.rb'

my_module_function()
```

Výše uvedený kód načte soubor *my_module.rb* z adresáře *"modules/my-module/lib/my-module-1.0.0"* a umožní vám používat funkce tohoto modulu. Pro instalaci modulu můžete použít příkaz *"dre install my-module"*.

Po dokončení instalace DragonRuby-Egg vypíše zprávu, která potvrzuje instalaci modulu, například: "The 'my-module' module has been installed in this './modules/my-module' folder."

Doufám, že vám tyto informace pomohou lépe pochopit, jak využít DragonRuby-Egg k instalaci a použití modulů v DragonRuby projektech.

## Poznámka

DragonRuby-Egg byl vytvořen pro použití v operačním systému Linux. Pokud používáte jiný operační systém, nemusí být aplikace správně funkční.

## Licence

DragonRuby-Egg je open-source software pod MIT licencí. Více informací naleznete v souboru LICENSE.
