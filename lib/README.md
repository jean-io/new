## Extensions

### Usage

---

The extension used by **new** is automatically extracted from a file's
name but it is still possible to use a set extension folder by using
the -e option.

It is also possible to use a custom builder by passing the -b option
to **new**

### Builders

---

**new** uses builders to create an extension's files. Builders are
located in the extension's folder and there can be multiple builders
for a single extension.

### Create an extension

---

#### Create a dedicated folder

If the extension doesn't exist, create a folder with your extension's
name to host the extension's builder.

**e.g.:** If I want to use new to create python file (extension: 'py'),
I'll create a folder 'py' in this folder.

#### Create a builder

You can either change the `index.*` file if it exists, or create a
custom builder that will be sent as a parameter when creating a new
file.

The builder receives as arguments:

```
$1    The target path
$2    The path to the extension's folder
$3    The parameters passed to the builder
```

**e.g.:** If I want to create a builder named *example* for a python file,
I could create the following *example.sh* file in the extension's folder:

```bash
#!/bin/bash

echo "Running in folder $2"

echo "#!/usr/bin/env python

if __name__ == '__main__':
    print ('Hello world')
" > $1

if [ $3 = 'executable' ]; then
    chmod 755 $1
fi
```

#### Create a model

If you just want to have a base file automatically duplicated when
creating a new file, you might want to use a model. Wether the file
supports being ran directly is automatically determined and permissions
are set-up accordingly.

**NOTE:** If no working builder or model could be found, **new** will
look for a model with the current extension's extension (in the css
extension, using the builder 'index', **new** might end up looking for
the model 'index.css')

**e.g.:** If I want to create a model named *example* for a python file,
I could create the following 'example.py' file in the extension's folder:

```python
#!/usr/bin/env python

if __name__ == '__main__':
    print('Hello world')
```

The file will be ran once as it is also a supported builder name, but
it will be detected as something else and will finally be used as a model.

#### Finally

Once the extension's folder and builders have been created and added to
the local list, **new** will detect it and behave accordingly.

### Extension support

---

Supported extensions for builders:

```
(void)
.sh
.py
```

Supported extensions for models:

```
.txt
```

### Builders error codes

---

*Builder error codes should not be higher than 100 and should not be*
*between 1 and 9 to allow the program to detect parse/runtime errors when*
*attempting to run an incomplete model as a builder.*

```
0     Properly generated target file
10    Properly generated file, but not with target name
20    Could not create target file
21    Argument error
30+   Other error
```

