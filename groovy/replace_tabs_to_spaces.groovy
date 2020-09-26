import java.io.File
import groovy.io.FileType

//TEST. Generate 5 files in dir
5.times {

def file = new File("./groovy_files/file${it}.txt").text =
    """
hello hello
			hello
hello hello
			hello
    """
}

def dir = new File('./groovy_files/')
dir.eachFileRecurse (FileType.FILES) { file ->
    def in_fl = new File("$file")
    def tmp_content = new String (in_fl.text) 
    in_fl.withWriter {w -> tmp_content.eachLine {line -> w <<  line.replaceAll("\t","  ") + System.getProperty("line.separator") }
}
    }

def file0 = new File('./groovy_files/file0.txt')
println file0.text
