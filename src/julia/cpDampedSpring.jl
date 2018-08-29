function DampedSpring(a::Body, b::Body, anchorA::Vect, anchorB::Vect, restlength::Real, stiffness::Real, damping::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpDampedSpringNew), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}, Vect, Vect, Cdouble, Cdouble, Cdouble,), a.ptr, b.ptr, anchorA, anchorB, restlength, stiffness, damping)
end

function get_anchorA(spring::DampedSpring)
    ccall(Libdl.dlsym(libchipmunk, :cpDampedSpringGetAnchorA), Vect, (Ptr{Cvoid},), spring.ptr)
end

function set_anchorA(spring::DampedSpring, anchor::Vect)
    ccall(Libdl.dlsym(libchipmunk, :cpDampedSpringSetAnchorA), Cvoid, (Ptr{Cvoid}, Vect,), spring.ptr, anchor)
end

function get_anchorB(spring::DampedSpring)
    ccall(Libdl.dlsym(libchipmunk, :cpDampedSpringGetAnchorB), Vect, (Ptr{Cvoid},), spring.ptr)
end

function set_anchorB(spring::DampedSpring, anchor::Vect)
    ccall(Libdl.dlsym(libchipmunk, :cpDampedSpringSetAnchorB), Cvoid, (Ptr{Cvoid}, Vect,), spring.ptr, anchor)
end

function get_restlength(spring::DampedSpring)
    ccall(Libdl.dlsym(libchipmunk, :cpDampedSpringGetRestLength), Cdouble, (Ptr{Cvoid},), spring.ptr)
end

function set_restlength(spring::DampedSpring, restlength::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpDampedSpringSetRestLength), Cvoid, (Ptr{Cvoid}, Cdouble,), spring.ptr, restlength)
end

function get_stiffness(spring::DampedSpring)
    ccall(Libdl.dlsym(libchipmunk, :cpDampedSpringGetStiffness), Cdouble, (Ptr{Cvoid},), spring.ptr)
end

function set_stiffness(spring::DampedSpring, stiffness::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpDampedSpringSetStiffness), Cvoid, (Ptr{Cvoid}, Cdouble,), spring.ptr, stiffness)
end

function get_damping(spring::DampedSpring)
    ccall(Libdl.dlsym(libchipmunk, :cpDampedSpringGetDamping), Cdouble, (Ptr{Cvoid},), spring.ptr)
end

function set_damping(spring::DampedSpring, damping::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpDampedSpringSetDamping), Cvoid, (Ptr{Cvoid}, Cdouble,), spring.ptr, damping)
end

export DampedSpring, get_anchorA, set_anchorA, get_anchorB, set_anchorB, get_restlength, set_restlength,
get_stiffness, set_stiffness, get_damping, set_damping
