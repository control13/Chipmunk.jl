function PinJoint(a::Body, b::Body, anchorA::Vect, anchorB::Vect)
    PinJoint(ccall(Libdl.dlsym(libchipmunk, :cpPinJointNew2), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}, Vect, Vect,), a.ptr, b.ptr, anchorA, anchorB))
end

function get_anchorA(joint::PinJoint)
    ccall(Libdl.dlsym(libchipmunk, :cpPinJointGetAnchorA), Vect, (Ptr{Cvoid},), joint.ptr)
end

function set_anchorA(joint::PinJoint, anchorA::Vect)
    ccall(Libdl.dlsym(libchipmunk, :cpPinJointSetAnchorA), Cvoid, (Ptr{Cvoid}, Vect,), joint.ptr, anchorA)
end

function get_anchorB(joint::PinJoint)
    ccall(Libdl.dlsym(libchipmunk, :cpPinJointGetAnchorB), Vect, (Ptr{Cvoid},), joint.ptr)
end

function set_anchorB(joint::PinJoint, anchorB::Vect)
    ccall(Libdl.dlsym(libchipmunk, :cpPinJointSetAnchorB), Cvoid, (Ptr{Cvoid}, Vect,), joint.ptr, anchorB)
end

function get_dist(joint::PinJoint)
    ccall(Libdl.dlsym(libchipmunk, :cpPinJointGetDist), Cdouble, (Ptr{Cvoid},), joint.ptr)
end

function set_dist(joint::PinJoint, dist::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpPinJointSetDist), Cvoid, (Ptr{Cvoid}, Cdouble,), joint.ptr, dist)
end

export PinJoint, get_anchorA, get_anchorB, set_anchorA, set_anchorB, get_dist, set_dist
