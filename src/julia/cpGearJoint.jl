function GearJoint(a::Body, b::Body, phase::Real, ratio::Real)
    GearJoint(ccall(Libdl.dlsym(libchipmunk, :cpGearJointNew), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}, Cdouble, Cdouble,), a.ptr, b.ptr, phase, ratio))
end

function get_phase(joint::GearJoint)
    ccall(Libdl.dlsym(libchipmunk, :cpGearJointGetPhase), Cdouble, (Ptr{Cvoid},), joint.ptr)
end

function set_phase(joint::GearJoint, phase::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpGearJointSetPhase), Cvoid, (Ptr{Cvoid}, Cdouble,), joint.ptr, phase)
end

function get_ratio(joint::GearJoint)
    ccall(Libdl.dlsym(libchipmunk, :cpGearJointGetRatio), Cdouble, (Ptr{Cvoid},), joint.ptr)
end

function set_ratio(joint::GearJoint, ratio::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpGearJointSetRatio), Cvoid, (Ptr{Cvoid}, Cdouble,), joint.ptr, ratio)
end

export GearJoint, get_phase, set_phase, get_ratio, set_ratio
