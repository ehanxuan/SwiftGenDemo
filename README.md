# SwiftGenDemo

### 开源项目：
https://github.com/SwiftGen/SwiftGen

### 概要：
用来管理资源文件的工具。

### 问题：
当前引用资源文件的方法存在潜在的风险：
- 资源名称拼写错误。如果项目资源很多检查拼写正确也是颇费时间
- 如果删除了一个资源文件，只能通过全局搜索资源名称来判断是否已经没有使用这个资源

### 原理：
为各资源文件建立枚举

### 好处：
- 不可能错误地引用不存在的资源文件
- 编码时会有提示

### 所支持的资源文件形式：
- Assets Catalogs images（不推荐）
- Localizable.strings strings.（推荐）
- UIStoryboards and their Scenes（未探讨）
- NSStoryboards and their Scenes（未探讨）
- Colors.（推荐）
- Fonts.（推荐）

### 使用方法
1. 安装
~~~~
$ brew install swiftgen
~~~~

2. 在项目根目录下创建 swiftgen.sh 文件
~~~~
#!/bin/sh
#===============================================================================
# SwiftGen Batch Script
#===============================================================================

SCRIPT_DIR=$(cd $(dirname $0);pwd)
RESOURCES_DIR=$SCRIPT_DIR/SwiftGenDemo/Resources

# Strings
GEN_STRINGS_SRC=$RESOURCES_DIR/Localizable.strings
GEN_STRINGS_DST=$RESOURCES_DIR/Localizable.swift

# Assets
GEN_ASSETS_SRC=$RESOURCES_DIR/Assets.xcassets
GEN_ASSETS_DST=$RESOURCES_DIR/Assets.swift

# Colors
GEN_COLORS_SRC=$RESOURCES_DIR/Colors.txt
GEN_COLORS_DST=$RESOURCES_DIR/Colors.swift

# Fonts
GEN_FONTS_SRC=$RESOURCES_DIR/Fonts
GEN_FONTS_DST=$RESOURCES_DIR/Fonts.swift

echo "##### Check swiftgen installation #####"
if which swiftgen >/dev/null; then
  echo "swiftgen is installed."
else 
  echo "swiftgen is not installed."
  exit 1
fi

echo "##### Generate #####"
swiftgen strings -t swift3 --output $GEN_STRINGS_DST $GEN_STRINGS_SRC
swiftgen images -t swift3 --output $GEN_ASSETS_DST $GEN_ASSETS_SRC
swiftgen colors -t swift3 --output $GEN_COLORS_DST $GEN_COLORS_SRC
swiftgen fonts -t swift3 --output $GEN_FONTS_DST $GEN_FONTS_SRC
~~~~

3. 代码结构
~~~~
(B.D.T.)
~~~~

4. 运行 swiftgen.sh 文件
~~~~
./swiftgen.sh
~~~~
运行完后，会生成以下文件
~~~~
Localizable.swift
Assets.swift
Colors.swift
Fonts.swift
~~~~

5. 调用
5_1. string 使用例
原来的写法
~~~~
welcomeLabel.text = NSLocalizedString("welcome", nil)
~~~~

现在的写法
~~~~
welcomeLabel.text = tr(.welcome)
~~~~

优点：
- 不需要硬编码"welcome"

5_2. color 使用例
原来的写法
~~~~
welcomeLabel.textColor = UIColor(red: 100/255.0, green: 150/255.0, blue: 200/255.0, alpha: 1)
~~~~
~~~~
welcomeLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)         // 339666，自定义颜色不能正确显示；不能定义通用颜色
~~~~
现在的写法
~~~~
welcomeLabel.textColor = UIColor(named: .articleBody)
~~~~

优点：
- 可以优雅地使用通用 color

5_3. 自定义 fonts 使用例
原来的写法
~~~~
welcomeLabel.font = UIFont(name: "Avenir-Heavy", size: 17)
~~~~

现在的写法
~~~~
welcomeLabel.font = UIFont(font: FontFamily.Avenir.heavy, size: 17)
~~~~

优点：
- 不需要硬编码"Avenir-Heavy"

5_4. 图片使用例
原来的写法
~~~~
sampleImage.image = #imageLiteral(resourceName: "SampleImage”)
~~~~
~~~~
sampleImage.image = UIImage(named: “sampleImage")
~~~~

现在的写法
~~~~
sampleImage.image = UIImage(asset: .sampleImage);
~~~~
~~~~
sampleImage.image = Asset.sampleImage.image
~~~~

缺点：
- xCode 8 的 image Literal 写法，编码时能提示 image 名，且可以有 preview 功能，故推荐使用原生的 image literal 写法

5_5. 由于当前没有引用过 UIStoryboards 或 NSStoryboards，暂时不作探讨。如有需要，可直接找官网说明。
https://github.com/SwiftGen/SwiftGen#uistoryboard


### 应用例
https://github.com/ehanxuan/SwiftGenDemo


