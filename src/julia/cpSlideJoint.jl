function SlideJoint(a::Body, b::Body, anchorA::Vect, anchorB::Vect, min::Real, max::Real)
    SlideJoint(ccall(Libdl.dlsym(libchipmunk, :cpSlideJointNew), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}, Vect, Vect, Cdouble, Cdouble,), a.ptr, b.ptr, anchorA, anchorB, min, max))
end

function get_anchorA(joint::SlideJoint)
    ccall(Libdl.dlsym(libchipmunk, :cpSlideJointGetAnchorA), Vect, (Ptr{Cvoid},), joint.ptr)
end

function set_anchorA(joint::SlideJoint, anchor::Vect)
    ccall(Libdl.dlsym(libchipmunk, :cpSlideJointSetAnchorA), Cvoid, (Ptr{Cvoid}, Vect,), joint.ptr, anchor)
end

function get_anchorB(joint::SlideJoint)
    ccall(Libdl.dlsym(libchipmunk, :cpSlideJointGetAnchorB), Vect, (Ptr{Cvoid},), joint.ptr)
end

function set_anchorB(joint::SlideJoint, anchor::Vect)
    ccall(Libdl.dlsym(libchipmunk, :cpSlideJointSetAnchorB), Cvoid, (Ptr{Cvoid}, Vect,), joint.ptr, anchor)
end

function get_min(joint::SlideJoint)
    ccall(Libdl.dlsym(libchipmunk, :cpSlideJointGetMin), Cdouble, (Ptr{Cvoid},), joint.ptr)
end

function set_min(joint::SlideJoint, min::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpSlideJointSetMin), Cvoid, (Ptr{Cvoid}, Cdouble,), joint.ptr, min)
end

function get_max(joint::SlideJoint)
    ccall(Libdl.dlsym(libchipmunk, :cpSlideJointGetMin), Cdouble, (Ptr{Cvoid},), joint.ptr)
end

function set_max(joint::SlideJoint, max::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpSlideJointSetMin), Cvoid, (Ptr{Cvoid}, Cdouble,), joint.ptr, max)
end

export SlideJoint, get_anchorA, set_anchorA, get_anchorB, set_anchorB, get_min, set_min,
get_max, set_max
