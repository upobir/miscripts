#!/usr/bin/awk -f

/^[a-zA-Z]*:/ {
    split($0, parts, ":");
    addElement(targets, parts[1]);

    helptarget = (parts[1] == "help");
}

helptarget && /^\t@echo \"   \" / {  #"
    helptargets[$4] = 1;
}

helptarget && (/^\t/ || /^help:/) {
    addElement(helplines, $0);
    next;
}

helptarget && $0 == "" {
    next;
}

{
    addElement(lines, $0);
    
}

END {
    if (length(helplines) == 0) {
        addElement(helplines, "help:");
        addElement(helplines, "\t@echo targets:")
    }
    addHelpLine("help")
    for (i = 0; i < length(targets); i++) {
        addHelpLine(targets[i]);
    }


    for (i = 0; i < length(helplines); i++) {
        print helplines[i];
    }
    print ""
    for (i = 0; i < length(lines); i++) {
        print lines[i];
    }
}

function addElement(arr, x) {
    arr[length(arr)] = x;
}

function addHelpLine(x) {
    if (x in helptargets) {
        return;
    }
    addElement(helplines, "\t@echo \"   \" " x);
    helptargets[x] = 1;
}