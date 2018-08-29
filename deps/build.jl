deps_path = @__DIR__
cd(deps_path)
println("Checking dependencies...")

try
    @static if Sys.islinux()
        run(`which cmake`)
    end
catch exception
    error("You must install cmake to build this package.")
end

println("Good...")

if !isdir("Chipmunk2D")
    println("Cloning Chipmunk source...")

    cd(deps_path)
    run(`git clone https://github.com/slembcke/Chipmunk2D.git`)
end

cd("Chipmunk2D")
chipmunk_version = "7.0.2"
run(`git checkout Chipmunk-$(chipmunk_version)`)

# run(`git checkout Chipmunk-7.0.0`)

run(`cmake . -DBUILD_DEMOS=OFF`)
run(`make`)

ext = ""

@static if Sys.islinux()
    ext = "so"
    cp("src/libchipmunk.so.$(chipmunk_version)", "../libchipmunk.so", force=true)
end
@static if Sys.isapple()
    ext = "dylib"
    cp("src/libchipmunk.$(chipmunk_version).dylib", "../libchipmunk.dylib", force=true)
end
@static if Sys.iswindows()
    ext = "dll"
    cp("src/libchipmunk.$(chipmunk_version).dll", "../libchipmunk.dll", force=true)
end


cd("..")

run(`gcc -fPIC -I./Chipmunk2D/include/chipmunk -c $(deps_path)/../src/c/chipmunkjl.c`)
run(`gcc -I./Chipmunk2D/include/chipmunk -L. -lchipmunk -shared -o ./libchipmunkjl.$ext chipmunkjl.o`)
run(`rm chipmunkjl.o`)

# rm("Chipmunk2D", recursive=true)

println("Successfully built Chipmunk.jl!")
