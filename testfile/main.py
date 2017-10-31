
def getExtension(str):
    comments = {
        "py" : "#",
        "c" : "//",
        "go" : "//",
        ".sh" : "#",
        "h" : "//"
        }

    try:
        result = comments[str]
    except:
        result = "\""

    return result

def toComment(line, ext):

    idx = line.find(ext)
    print(idx)

    if idx >= 0:
        line = line.replace(ext, "")
    else:
        spaceless = line.lstrip()
        line = line.replace(spaceless, ext + spaceless)

    return line

("Hello World")

for i in range(10):
    print(i)

print(getExtension("py"))
print(getExtension("c"))
print(getExtension(""))


str = "print('Hello World')"
ext = getExtension("py")

idx = str.find(ext)
print(idx)

if idx >= 0:
    str = str.replace(ext, "")
else:
    spaceless = str.lstrip()
    str = str.replace(spaceless, ext + spaceless)

print(str)

