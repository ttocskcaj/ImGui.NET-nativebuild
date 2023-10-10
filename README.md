This is an attempt to get implot updated and working with imgui.net

# To build native debug versions of imgui and implot

1. git clone https://github.com/tomvdb/ImGui.NET-nativebuild.git

2. git submodule update --init --recursive

3. build-native-cimgui-cimplot.cmd debug x64

4. build-native-cimgui-cimplot.cmd debug x86

5. cimgui.dll and cimplot.dll is in root build folder

Currently only tried with debugging versions to sort out any issues from using

# To Update to the latest cimgui version

1. git submodule update --init

2. git submodule update --remote

3. Update the version in version.json file

4. and then git commit + push.


# To Trigger a release push a tag as shown below

2. git tag -a v1.4 -m "my version 1.4"

3. git push origin v1.4
