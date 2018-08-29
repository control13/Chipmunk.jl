function SimpleMotor(a::Body, b::Body, rate::Real)
    SimpleMotor(ccall(Libdl.dlsym(libchipmunk, :cpSimpleMotorNew), Ptr{Cvoid}, (Ptr{Cvoid}, Ptr{Cvoid}, Cdouble,), a.ptr, b.ptr, rate))
end

function get_rate(motor::SimpleMotor)
    ccall(Libdl.dlsym(libchipmunk, :cpSimpleMotorGetRate), Cdouble, (Ptr{Cvoid},), motor.ptr)
end

function set_rate(motor::SimpleMotor, rate::Real)
    ccall(Libdl.dlsym(libchipmunk, :cpSimpleMotorSetRate), Cvoid, (Ptr{Cvoid}, Cdouble,), motor.ptr, rate)
end

export SimpleMotor, get_rate, set_rate
