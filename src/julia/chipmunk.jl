function momentforbox(mass::Real, width::Real, height::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpMomentForBox), Cdouble, (Cdouble, Cdouble, Cdouble,), mass, width, height)
end

export momentforbox
