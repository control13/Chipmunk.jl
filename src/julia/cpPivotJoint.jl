function PivotJoint(a::Body, b::Body, pivot::Vect)
    PivotJoint(ccall(Libdl.dlsym(libchipmunk, :cpPivotJointNew), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}, Vect,), a.ptr, b.ptr, pivot))
end

function PivotJoint(a::Body, b::Body, anchorA::Vect, anchorB::Vect)
    PivotJoint(ccall(Libdl.dlsym(libchipmunk, :cpPivotJointNew2), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}, Vect, Vect,), a.ptr, b.ptr, anchorA, anchorB))
end

function get_anchorA(joint::PivotJoint)
    ccall(Libdl.dlsym(libchipmunk, :cpPivotJointGetAnchorA), Vect, (Ptr{Cvoid},), joint.ptr)
end

function set_anchorA(joint::PivotJoint, anchorA::Vect)
    ccall(Libdl.dlsym(libchipmunk, :cpPivotJointSetAnchorA), Cvoid, (Ptr{Cvoid}, Vect,), joint.ptr, anchorA)
end

function get_anchorB(joint::PivotJoint)
    ccall(Libdl.dlsym(libchipmunk, :cpPivotJointGetAnchorB), Vect, (Ptr{Cvoid},), joint.ptr)
end

function set_anchorB(joint::PivotJoint, anchorB::Vect)
    ccall(Libdl.dlsym(libchipmunk, :cpPivotJointSetAnchorB), Cvoid, (Ptr{Cvoid}, Vect,), joint.ptr, anchorB)
end

export PivotJoint, get_anchorA, get_anchorB, set_anchorA, set_anchorB
