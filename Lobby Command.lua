﻿--panorama https://github.com/Shir0ha/luv8/tree/source2
--Chris's Public Lua - Lolz Checker, !start !stop and More.Lua https://github.com/OWORD/gamesense-workshop-luas/blob/main/Chris's%20Public%20Lua%20-%20Lolz%20Checker%2C%20!start%20!stop%20and%20More.lua
--BY:LinFen

if not ffi then 
  return error("Turn on unsafe scripts")
end

local panorama = (function()
  local _INFO, cast, typeof, new, string, metatype, find_pattern, create_interface, add_shutdown_callback, safe_mode, ffiCEnabled, shutdown, _error, exception, exceptionCb, rawgetImpl, rawsetImpl, __thiscall, table_copy, vtable_bind, interface_ptr, vtable_entry, vtable_thunk, get_relative_call, proc_bind, follow_call, v8js_args, v8js_function, is_array, nullptr, intbuf, panorama, vtable, DllImport, UIEngine, nativeIsValidPanelPointer, nativeCompileRunScript, nativeGetIsolate, nativeHandleException, nativeGetID, nativeGetPanelContext, jsContexts, v8_dll, pIsolate, persistentTbl, Message, Local, MaybeLocal, PersistentProxy_mt, Persistent, Value, Object, Array, Function, FunctionTemplate, FunctionCallbackInfo, Primitive, Null, Undefined, Boolean, Number, Integer, String, Isolate, Context, HandleScope, TryCatch, Script, PanelInfo_t, CUtlVector_Constructor_t, panelArray
  _INFO = {
      _VERSION = 1.99
  }
  setmetatable(_INFO, {
      __call = function(self)
          return self._VERSION
      end,
      __tostring = function(self)
          return self._VERSION
      end
  })
  cast, typeof, new, string, metatype = ffi.cast, ffi.typeof, ffi.new, ffi.string, ffi.metatype
  find_pattern = function()
      return error('Unsupported provider')
  end
  create_interface = function()
      return error('Unsupported provider')
  end
  add_shutdown_callback = function()
      return print('WARNING: Cleanup before shutdown disabled')
  end
  local api
  while true do
      if _G == nil then
          api = 'fa7ality'
          break
      end
      api = 'aimware'
      break
  end
  local _exp_0 = api
  if 'fa7ality' == _exp_0 then
      find_pattern = utils.find_pattern
      create_interface = function(module_name, interface_name)
          local fnptr = utils.find_export(module_name, 'CreateInterface')
          if not fnptr then
              return nil
          end
          local res = cast('void*(__cdecl*)(const char*, int*)', fnptr)(interface_name, nil)
          return res ~= nil and res or nil
      end
      add_shutdown_callback = function() end
  elseif 'aimware' == _exp_0 then
      find_pattern = function(module_name, pattern)
          local pat = _G.string.gsub(pattern, '?', '??')
          return mem.FindPattern(module_name, pat)
      end
      create_interface = function(module_name, interface_name)
          local fnptr = find_pattern(module_name, '4C 8B 0D ? ? ? ? 4C 8B D2 4C 8B D9')
          if not fnptr then
              return nil
          end
          local res = cast('void*(__cdecl*)(const char*, int*)', fnptr)(interface_name, nil)
          return res ~= nil and res or nil
      end
  end
  safe_mode = (xpcall and pcall) and true or false
  ffiCEnabled = ffi.C and api ~= 'gamesense'
  --print(('\nluv8 panorama library %s;\nhttps://github.com/Shir0ha/luv8\napi: %s; safe_mode: %s; ffi.C: %s'):format(_INFO._VERSION, api, tostring(safe_mode), tostring(ffiCEnabled)))
  shutdown = function()
      for _, v in pairs(persistentTbl) do
          Persistent(v):disposeGlobal()
      end
  end
  _error = error
  if error then
      error = function(msg)
          shutdown()
          _error(msg)
          return you_are_seeing_this_because_the_error_handling_of_your_software_is_non_existent()
      end
  end
  exception = function(msg)
      return print('Caught lua exception in V8 HandleScope: ', tostring(msg))
  end
  exceptionCb = function(msg)
      return print('Caught lua exception in V8 Function Callback: ', tostring(msg))
  end
  rawgetImpl = function(tbl, key)
      local mtb = getmetatable(tbl)
      setmetatable(tbl, nil)
      local res = tbl[key]
      setmetatable(tbl, mtb)
      return res
  end
  rawsetImpl = function(tbl, key, value)
      local mtb = getmetatable(tbl)
      setmetatable(tbl, nil)
      tbl[key] = value
      return setmetatable(tbl, mtb)
  end
  if not rawget then
      rawget = rawgetImpl
  end
  if not rawset then
      rawset = rawsetImpl
  end
  __thiscall = function(func, this)
      return function(...)
          return func(this, ...)
      end
  end
  table_copy = function(t)
      local _tbl_0 = { }
      for k, v in pairs(t) do
          _tbl_0[k] = v
      end
      return _tbl_0
  end
  vtable_bind = function(module, interface, index, typedef)
      local addr = cast('void***', create_interface(module, interface)) or error(interface .. ' is nil.')
      return __thiscall(cast(typedef, addr[0][index]), addr)
  end
  interface_ptr = typeof('void***')
  vtable_entry = function(instance, i, ct)
      return cast(ct, cast(interface_ptr, instance)[0][i])
  end
  vtable_thunk = function(i, ct)
      local t = typeof(ct)
      return function(instance, ...)
          return vtable_entry(instance, i, t)(instance, ...)
      end
  end
  get_relative_call = function(ptr)
      local offset = cast('uint32_t*', cast('uintptr_t', ptr) + 2)[0]
      local rip = ptr + 0x6
      return offset + rip
  end
  proc_bind = (function()
      local fnGetProcAddress
      fnGetProcAddress = function()
          return error('Failed to load GetProcAddress')
      end
      local fnGetModuleHandle
      fnGetModuleHandle = function()
          return error('Failed to load GetModuleHandleA')
      end
      if ffiCEnabled then
          ffi.cdef([[            uintptr_t GetProcAddress(uintptr_t, const char*);
              uintptr_t GetModuleHandleA(const char*);
          ]])
          fnGetProcAddress = ffi.C.GetProcAddress
          fnGetModuleHandle = ffi.C.GetModuleHandleA
      else
          fnGetProcAddress = cast('uintptr_t(__stdcall*)(uintptr_t, const char*)', cast('uintptr_t*', get_relative_call(find_pattern('engine2.dll', 'FF 15 ? ? ? ? 48 85 C0 74 14 48 8B 0D ? ? ? ? 44')))[0])
          fnGetModuleHandle = cast('uintptr_t(__stdcall*)(const char*)', cast('uintptr_t*', get_relative_call(find_pattern('engine2.dll', 'FF 15 ? ? ? ? 33 F6 48 8B C8')))[0])
      end
      return function(module_name, function_name, typedef)
          return cast(typeof(typedef), fnGetProcAddress(fnGetModuleHandle(module_name), function_name))
      end
  end)()
  follow_call = function(ptr)
      local insn = cast('uint8_t*', ptr)
      local _exp_1 = insn[0]
      if (0xE8 or 0xE9) == _exp_1 then
          return cast('uintptr_t', insn + cast('int32_t*', insn + 1)[0] + 5)
      elseif 0xFF == _exp_1 then
          if insn[1] == 0x15 then
              return cast('uintptr_t**', cast('const char*', ptr) + 2)[0][0]
          end
      else
          return ptr
      end
  end
  v8js_args = function(...)
      local argTbl = {
          ...
      }
      local iArgc = #argTbl
      local pArgv = new(('void*[%.f]'):format(iArgc))
      for i = 1, iArgc do
          pArgv[i - 1] = Value:fromLua(argTbl[i]):getInternal()
      end
      return iArgc, pArgv
  end
  v8js_function = function(callbackFunction)
      return function(callbackInfo)
          callbackInfo = FunctionCallbackInfo(callbackInfo)
          local argTbl = { }
          local length = callbackInfo:length()
          if length > 0 then
              for i = 0, length - 1 do
                  table.insert(argTbl, callbackInfo:get(i))
              end
          end
          local val = nil
          if safe_mode then
              local status, ret = xpcall((function()
                  return callbackFunction(unpack(argTbl))
              end), exceptionCb)
              if status then
                  val = ret
              end
          else
              val = callbackFunction(unpack(argTbl))
          end
          return callbackInfo:setReturnValue(Value:fromLua(val):getInternal())
      end
  end
  is_array = function(val)
      local i = 1
      for _ in pairs(val) do
          if val[i] ~= nil then
              i = i + 1
          else
              return false
          end
      end
      return i ~= 1
  end
  nullptr = new('void*')
  intbuf = new('int[1]')
  panorama = {
      panelIDs = { }
  }
  do
      local _class_0
      local _base_0 = {
          get = function(self, index, t)
              return __thiscall(cast(t, self.this[0][index]), self.this)
          end,
          getInstance = function(self)
              return self.this
          end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function(self, ptr)
              self.this = cast('void***', ptr)
          end,
          __base = _base_0,
          __name = "vtable"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      vtable = _class_0
  end
  do
      local _class_0
      local _base_0 = {
          cache = { },
          get = function(self, method, typedef)
              if not (self.cache[method]) then
                  self.cache[method] = proc_bind(self.file, method, typedef)
              end
              return self.cache[method]
          end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function(self, filename)
              self.file = filename
          end,
          __base = _base_0,
          __name = "DllImport"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      DllImport = _class_0
  end
  UIEngine = vtable(vtable_bind('panorama.dll', 'PanoramaUIEngine001', 13, 'void*(__thiscall*)(void*)')())
  nativeIsValidPanelPointer = UIEngine:get(32, 'bool(__thiscall*)(void*,void const*)')
  nativeCompileRunScript = UIEngine:get(81, 'void****(__thiscall*)(void*,void*,char const*,char const*,int)')
  nativeGetIsolate = UIEngine:get(96, 'void*(__thiscall*)(void*)')
  nativeHandleException = UIEngine:get(90, 'void(__thiscall*)(void*, void*, void*)')
  nativeGetID = vtable_thunk(11, 'const char*(__thiscall*)(void*)')
  nativeGetPanelContext = UIEngine:get(89, 'void***(__thiscall*)(void*,void*)')
  jsContexts = { }
  v8_dll = DllImport('v8.dll')
  pIsolate = nativeGetIsolate()
  persistentTbl = { }
  do
      local _class_0
      local _base_0 = { }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function(self, val)
              self.this = cast('void*', val)
          end,
          __base = _base_0,
          __name = "Message"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      Message = _class_0
  end
  do
      local _class_0
      local _base_0 = {
          getInternal = function(self)
              return self.this
          end,
          isValid = function(self)
              return self.this[0] ~= nullptr
          end,
          getMessage = function(self)
              return Message(self.this[0])
          end,
          globalize = function(self)
              local pPersistent = v8_dll:get('?GlobalizeReference@api_internal@v8@@YAPEA_KPEAVIsolate@internal@2@_K@Z', 'void*(__fastcall*)(void*,void*)')(pIsolate, self.this[0])
              local persistent = Persistent(pPersistent)
              persistentTbl[persistent:getIdentityHash()] = pPersistent
              return persistent
          end,
          __call = function(self)
              return Value(self.this[0])
          end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function(self, val)
              self.this = cast('void**', val)
          end,
          __base = _base_0,
          __name = "Local"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      Local = _class_0
  end
  do
      local _class_0
      local _base_0 = {
          getInternal = function(self)
              return self.this
          end,
          toLocalChecked = function(self)
              if not (self.this[0] == nullptr) then
                  return Local(self.this)
              end
          end,
          toValueChecked = function(self)
              if not (self.this[0] == nullptr) then
                  return Value(self.this[0])
              end
          end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function(self, val)
              self.this = cast('void**', val)
          end,
          __base = _base_0,
          __name = "MaybeLocal"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      MaybeLocal = _class_0
  end
  PersistentProxy_mt = {
      __index = function(self, key)
          local this = rawget(self, 'this')
          local ret = HandleScope()(function()
              return this:getAsValue():toObject():get(Value:fromLua(key):getInternal()):toValueChecked():toLua()
          end)
          if type(ret) == 'table' then
              rawset(ret, 'parent', this)
          end
          return ret
      end,
      __newindex = function(self, key, value)
          local this = rawget(self, 'this')
          return HandleScope()(function()
              return this:getAsValue():toObject():set(Value:fromLua(key):getInternal(), Value:fromLua(value):getInternal()):toValueChecked():toLua()
          end)
      end,
      __len = function(self)
          local this = rawget(self, 'this')
          local ret = 0
          if this.baseType == 'Array' then
              ret = HandleScope()(function()
                  return this:getAsValue():toArray():length()
              end)
          elseif this.baseType == 'Object' or this.baseType == 'Function' then
              ret = HandleScope()(function()
                  return this:getAsValue():toObject():getPropertyNames():toValueChecked():toArray():length()
              end)
          end
          return tonumber(ret)
      end,
      __pairs = function(self)
          local this = rawget(self, 'this')
          local ret
          ret = function()
              return nil
          end
          if this.baseType == 'Object' or this.baseType == 'Function' then
              HandleScope()(function()
                  local keys = Array(this:getAsValue():toObject():getPropertyNames():toValueChecked():getInternal())
                  local current, size = 0, tonumber(keys:length())
                  local keys_localized
                  do
                      local _accum_0 = { }
                      local _len_0 = 1
                      for i = 0, size - 1 do
                          _accum_0[_len_0] = keys:get(i):toValueChecked():stringValue()
                          _len_0 = _len_0 + 1
                      end
                      keys_localized = _accum_0
                  end
                  ret = function()
                      current = current + 1
                      local key = keys_localized[current]
                      if current <= size then
                          return key, self[key]
                      end
                  end
              end)
          end
          return ret
      end,
      __ipairs = function(self)
          local this = rawget(self, 'this')
          local ret
          ret = function()
              return nil
          end
          if this.baseType == 'Array' then
              HandleScope()(function()
                  local current, size = 0, this:getAsValue():toArray():length()
                  ret = function()
                      current = current + 1
                      if current <= size then
                          return current - 1, self[current - 1]
                      end
                  end
              end)
          end
          return ret
      end,
      __call = function(self, ...)
          local this = rawget(self, 'this')
          local args = {
              ...
          }
          if this.baseType ~= 'Function' then
              error('Attempted to call a non-function value: ' .. this.baseType)
          end
          local terminateExecution = false
          local ret = HandleScope()(function()
              local tryCatch = TryCatch()
              tryCatch:enter()
              local rawReturn = this:getAsValue():toFunction():setParent(rawget(self, 'parent'))(unpack(args)):toLocalChecked()
              if tryCatch:hasCaught() then
                  nativeHandleException(tryCatch:getInternal(), panorama.getPanel("CSGOHud"))
                  if safe_mode then
                      terminateExecution = true
                  end
              end
              tryCatch:exit()
              if rawReturn == nil then
                  return nil
              else
                  return rawReturn():toLua()
              end
          end)
          if terminateExecution then
              error("\n\nFailed to call the given javascript function, please check the error message above ^ \n\n(definitely not because I was too lazy to implement my own exception handler)\n")
          end
          return ret
      end,
      __tostring = function(self)
          local this = rawget(self, 'this')
          return HandleScope()(function()
              return this:getAsValue():stringValue()
          end)
      end,
      __gc = function(self)
          local this = rawget(self, 'this')
          persistentTbl[this:getIdentityHash()] = nil
          return this:disposeGlobal()
      end
  }
  do
      local _class_0
      local _base_0 = {
          setType = function(self, val)
              self.baseType = val
              return self
          end,
          getInternal = function(self)
              return self.this
          end,
          disposeGlobal = function(self)
              return v8_dll:get('?DisposeGlobal@api_internal@v8@@YAXPEA_K@Z', 'void(__thiscall*)(void*)')(self.this)
          end,
          get = function(self)
              return MaybeLocal(HandleScope:createHandle(self.this))
          end,
          getAsValue = function(self)
              return Value(HandleScope:createHandle(self.this)[0])
          end,
          toLua = function(self)
              return self:get():toValueChecked():toLua()
          end,
          getIdentityHash = function(self)
              return v8_dll:get('?GetIdentityHash@Object@v8@@QEAAHXZ', 'int(__thiscall*)(void*)')(self.this)
          end,
          __call = function(self)
              return setmetatable({
                  this = self,
                  parent = nil
              }, PersistentProxy_mt)
          end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function(self, val, baseType)
              if baseType == nil then
                  baseType = 'Value'
              end
              self.this = val
              self.baseType = baseType
          end,
          __base = _base_0,
          __name = "Persistent"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      Persistent = _class_0
  end
  do
      local _class_0
      local _base_0 = {
          fromLua = function(self, val)
              if val == nil then
                  return Null(pIsolate):getValue()
              end
              local valType = type(val)
              local _exp_1 = valType
              if 'boolean' == _exp_1 then
                  return Boolean(pIsolate, val):getValue()
              elseif 'number' == _exp_1 then
                  return Number(pIsolate, val):getInstance()
              elseif 'string' == _exp_1 then
                  return String(pIsolate, val):getInstance()
              elseif 'table' == _exp_1 then
                  if is_array(val) then
                      return Array:fromLua(pIsolate, val)
                  else
                      return Object:fromLua(pIsolate, val)
                  end
              elseif 'function' == _exp_1 then
                  error('passing a lua function is not supported right now, if you can fix it, feel free to submit a pr')
                  return FunctionTemplate(v8js_function(val)):getFunction()()
              else
                  return error('Failed to convert from lua to v8js: Unknown type')
              end
          end,
          isUndefined = function(self)
              return v8_dll:get('?IsUndefined@Value@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          isNull = function(self)
              return v8_dll:get('?IsNull@Value@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          isBoolean = function(self)
              return v8_dll:get('?IsBoolean@Value@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          isBooleanObject = function(self)
              return v8_dll:get('?IsBooleanObject@Value@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          isNumber = function(self)
              return v8_dll:get('?IsNumber@Value@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          isNumberObject = function(self)
              return v8_dll:get('?IsNumberObject@Value@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          isString = function(self)
              return v8_dll:get('?IsString@Value@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          isStringObject = function(self)
              return v8_dll:get('?IsStringObject@Value@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          isObject = function(self)
              return v8_dll:get('?IsObject@Value@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          isArray = function(self)
              return v8_dll:get('?IsArray@Value@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          isFunction = function(self)
              return v8_dll:get('?IsFunction@Value@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          booleanValue = function(self)
              return v8_dll:get('?Value@Boolean@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          numberValue = function(self)
              return v8_dll:get('?Value@Number@v8@@QEBANXZ', 'double(__thiscall*)(void*)')(self.this)
          end,
          stringValue = function(self)
              local strBuf = new('char*[2]')
              local val = v8_dll:get('??0Utf8Value@String@v8@@QEAA@PEAVIsolate@2@V?$Local@VValue@v8@@@2@@Z', 'struct{char* str; int length;}*(__fastcall*)(void*,void*,void*)')(strBuf, pIsolate, self.this)
              local s = string(val.str, val.length)
              v8_dll:get('??1Utf8Value@String@v8@@QEAA@XZ', 'void(__thiscall*)(void*)')(strBuf)
              return s
          end,
          toObject = function(self)
              return Object(MaybeLocal(v8_dll:get('?ToObject@Value@v8@@QEBA?AV?$MaybeLocal@VObject@v8@@@2@V?$Local@VContext@v8@@@2@@Z', 'void*(__fastcall*)(void*,void*)')(self.this, intbuf)):toValueChecked():getInternal())
          end,
          toArray = function(self)
              return Array(MaybeLocal(v8_dll:get('?ToObject@Value@v8@@QEBA?AV?$MaybeLocal@VObject@v8@@@2@V?$Local@VContext@v8@@@2@@Z', 'void*(__fastcall*)(void*,void*)')(self.this, intbuf)):toValueChecked():getInternal())
          end,
          toFunction = function(self)
              return Function(MaybeLocal(v8_dll:get('?ToObject@Value@v8@@QEBA?AV?$MaybeLocal@VObject@v8@@@2@V?$Local@VContext@v8@@@2@@Z', 'void*(__fastcall*)(void*,void*)')(self.this, intbuf)):toValueChecked():getInternal())
          end,
          toLua = function(self)
              if self:isUndefined() or self:isNull() then
                  return nil
              end
              if self:isBoolean() or self:isBooleanObject() then
                  return self:booleanValue()
              end
              if self:isNumber() or self:isNumberObject() then
                  return self:numberValue()
              end
              if self:isString() or self:isStringObject() then
                  return self:stringValue()
              end
              if self:isObject() then
                  if self:isArray() then
                      return Local(self.this):globalize():setType('Array')()
                  end
                  if self:isFunction() then
                      return Local(self.this):globalize():setType('Function')()
                  end
                  return Local(self.this):globalize():setType('Object')()
              end
              return error('Failed to convert from v8js to lua: Unknown type')
          end,
          getInternal = function(self)
              return self.this
          end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function(self, val)
              self.this = cast('void*', val)
          end,
          __base = _base_0,
          __name = "Value"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      Value = _class_0
  end
  do
      local _class_0
      local _parent_0 = Value
      local _base_0 = {
          fromLua = function(self, isolate, val)
              local obj = Object(MaybeLocal(v8_dll:get('?New@Object@v8@@SA?AV?$Local@VObject@v8@@@2@PEAVIsolate@2@@Z', 'void*(__fastcall*)(void*,void*)')(intbuf, isolate)):toValueChecked():getInternal())
              for i, v in pairs(val) do
                  obj:set(Value:fromLua(i):getInternal(), Value:fromLua(v):getInternal())
              end
              return obj
          end,
          get = function(self, key)
              return MaybeLocal(v8_dll:get('?Get@Object@v8@@QEAA?AV?$MaybeLocal@VValue@v8@@@2@V?$Local@VContext@v8@@@2@V?$Local@VValue@v8@@@2@@Z', 'void*(__fastcall*)(void*,void*,void*,void*)')(self.this, intbuf, nil, key))
          end,
          set = function(self, key, value)
              return v8_dll:get('?Set@Object@v8@@QEAA?AV?$Maybe@_N@2@V?$Local@VContext@v8@@@2@V?$Local@VValue@v8@@@2@1@Z', 'bool(__fastcall*)(void*,void*,void*,void*,void*)')(self.this, intbuf, nil, key, value)
          end,
          getPropertyNames = function(self)
              return MaybeLocal(v8_dll:get('?GetPropertyNames@Object@v8@@QEAA?AV?$MaybeLocal@VArray@v8@@@2@V?$Local@VContext@v8@@@2@@Z', 'void*(__fastcall*)(void*,void*,void*)')(self.this, intbuf, nil))
          end,
          callAsFunction = function(self, recv, argc, argv)
              return MaybeLocal(v8_dll:get('?CallAsFunction@Object@v8@@QEAA?AV?$MaybeLocal@VValue@v8@@@2@V?$Local@VContext@v8@@@2@V?$Local@VValue@v8@@@2@HQEAV52@@Z', 'void*(__fastcall*)(void*,void*,void*,void*,int,void*)')(self.this, intbuf, Isolate():getCurrentContext(), recv, argc, argv))
          end,
          getIdentityHash = function(self)
              return v8_dll:get('?GetIdentityHash@Object@v8@@QEAAHXZ', 'int(__thiscall*)(void*)')(self.this)
          end
      }
      _base_0.__index = _base_0
      setmetatable(_base_0, _parent_0.__base)
      _class_0 = setmetatable({
          __init = function(self, val)
              self.this = val
          end,
          __base = _base_0,
          __name = "Object",
          __parent = _parent_0
      }, {
          __index = function(cls, name)
              local val = rawget(_base_0, name)
              if val == nil then
                  local parent = rawget(cls, "__parent")
                  if parent then
                      return parent[name]
                  end
              else
                  return val
              end
          end,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      if _parent_0.__inherited then
          _parent_0.__inherited(_parent_0, _class_0)
      end
      Object = _class_0
  end
  do
      local _class_0
      local _parent_0 = Object
      local _base_0 = {
          fromLua = function(self, isolate, val)
              local arr = Array(MaybeLocal(v8_dll:get('?New@Array@v8@@SA?AV?$Local@VArray@v8@@@2@PEAVIsolate@2@PEAV?$Local@VValue@v8@@@2@_K@Z', 'void*(__fastcall*)(void*,void*,int)')(intbuf, isolate, #val)):toValueChecked():getInternal())
              for i = 1, #val do
                  arr:set(i - 1, Value:fromLua(val[i]):getInternal())
              end
              return arr
          end,
          get = function(self, key)
              return MaybeLocal(v8_dll:get('?Get@Object@v8@@QEAA?AV?$MaybeLocal@VValue@v8@@@2@V?$Local@VContext@v8@@@2@I@Z', 'void*(__fastcall*)(void*,void*,void*,unsigned int)')(self.this, intbuf, nil, key))
          end,
          set = function(self, key, value)
              return v8_dll:get('?Set@Object@v8@@QEAA?AV?$Maybe@_N@2@V?$Local@VContext@v8@@@2@IV?$Local@VValue@v8@@@2@@Z', 'bool(__fastcall*)(void*,void*,void*,unsigned int,void*)')(self.this, intbuf, nil, key, value)
          end,
          length = function(self)
              return v8_dll:get('?Length@Array@v8@@QEBAIXZ', 'uintptr_t(__thiscall*)(void*)')(self.this)
          end
      }
      _base_0.__index = _base_0
      setmetatable(_base_0, _parent_0.__base)
      _class_0 = setmetatable({
          __init = function(self, val)
              self.this = val
          end,
          __base = _base_0,
          __name = "Array",
          __parent = _parent_0
      }, {
          __index = function(cls, name)
              local val = rawget(_base_0, name)
              if val == nil then
                  local parent = rawget(cls, "__parent")
                  if parent then
                      return parent[name]
                  end
              else
                  return val
              end
          end,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      if _parent_0.__inherited then
          _parent_0.__inherited(_parent_0, _class_0)
      end
      Array = _class_0
  end
  do
      local _class_0
      local _parent_0 = Object
      local _base_0 = {
          setParent = function(self, val)
              self.parent = val
              return self
          end,
          __call = function(self, ...)
              if self.parent == nil then
                  return self:callAsFunction(Context(Isolate():getCurrentContext()):global():toValueChecked():getInternal(), v8js_args(...))
              else
                  return self:callAsFunction(self.parent:getAsValue():getInternal(), v8js_args(...))
              end
          end
      }
      _base_0.__index = _base_0
      setmetatable(_base_0, _parent_0.__base)
      _class_0 = setmetatable({
          __init = function(self, val, parent)
              self.this = val
              self.parent = parent
          end,
          __base = _base_0,
          __name = "Function",
          __parent = _parent_0
      }, {
          __index = function(cls, name)
              local val = rawget(_base_0, name)
              if val == nil then
                  local parent = rawget(cls, "__parent")
                  if parent then
                      return parent[name]
                  end
              else
                  return val
              end
          end,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      if _parent_0.__inherited then
          _parent_0.__inherited(_parent_0, _class_0)
      end
      Function = _class_0
  end
  do
      local _class_0
      local _base_0 = {
          getFunction = function(self)
              return MaybeLocal(v8_dll:get('?GetFunction@FunctionTemplate@v8@@QEAA?AV?$MaybeLocal@VFunction@v8@@@2@V?$Local@VContext@v8@@@2@@Z', 'void*(__fastcall*)(void*, void*, void*)')(self:this():getInternal(), intbuf, nil)):toLocalChecked()
          end,
          getInstance = function(self)
              return self:this()
          end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function(self, callback)
              self.this = MaybeLocal(v8_dll:get('?New@FunctionTemplate@v8@@SA?AV?$Local@VFunctionTemplate@v8@@@2@PEAVIsolate@2@P6AXAEBV?$FunctionCallbackInfo@VValue@v8@@@2@@ZV?$Local@VValue@v8@@@2@V?$Local@VSignature@v8@@@2@HW4ConstructorBehavior@2@W4SideEffectType@2@PEBVCFunction@2@GGG@Z', 'void*(__cdecl*)(void*,void*,void*,void*,void*,int,int,int,int,uint16_t,uint16_t,uint16_t)')(intbuf, pIsolate, cast('void(__cdecl*)(void******)', callback), new('int[1]'), new('int[1]'), 0, 0, 0, 0, 0, 0, 0)):toLocalChecked()
          end,
          __base = _base_0,
          __name = "FunctionTemplate"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      FunctionTemplate = _class_0
  end
  do
      local _class_0
      local _base_0 = {
          kHolderIndex = 0,
          kIsolateIndex = 1,
          kReturnValueDefaultValueIndex = 2,
          kReturnValueIndex = 3,
          kDataIndex = 4,
          kCalleeIndex = 5,
          kContextSaveIndex = 6,
          kNewTargetIndex = 7,
          getHolder = function(self)
              return MaybeLocal(self:getImplicitArgs_()[self.kHolderIndex]):toLocalChecked()
          end,
          getIsolate = function(self)
              return Isolate(self:getImplicitArgs_()[self.kIsolateIndex][0])
          end,
          getReturnValueDefaultValue = function(self)
              return Value(new('void*[1]', self:getImplicitArgs_()[self.kReturnValueDefaultValueIndex]))
          end,
          getReturnValue = function(self)
              return Value(new('void*[1]', self:getImplicitArgs_()[self.kReturnValueIndex]))
          end,
          setReturnValue = function(self, value)
              self:getImplicitArgs_()[self.kReturnValueIndex] = cast('void**', value)[0]
          end,
          getData = function(self)
              return MaybeLocal(self:getImplicitArgs_()[self.kDataIndex]):toLocalChecked()
          end,
          getCallee = function(self)
              return MaybeLocal(self:getImplicitArgs_()[self.kCalleeIndex]):toLocalChecked()
          end,
          getContextSave = function(self)
              return MaybeLocal(self:getImplicitArgs_()[self.kContextSaveIndex]):toLocalChecked()
          end,
          getNewTarget = function(self)
              return MaybeLocal(self:getImplicitArgs_()[self.kNewTargetIndex]):toLocalChecked()
          end,
          getImplicitArgs_ = function(self)
              return self.this[0]
          end,
          getValues_ = function(self)
              return self.this[1]
          end,
          getLength_ = function(self)
              return self.this[2]
          end,
          length = function(self)
              return tonumber(cast('int', self:getLength_()))
          end,
          get = function(self, i)
              if self:length() > i then
                  return Value(self:getValues_() - i):toLua()
              else
                  return
              end
          end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function(self, val)
              self.this = cast('void****', val)
          end,
          __base = _base_0,
          __name = "FunctionCallbackInfo"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      FunctionCallbackInfo = _class_0
  end
  do
      local _class_0
      local _parent_0 = Value
      local _base_0 = {
          getValue = function(self)
              return self.this
          end,
          toString = function(self)
              return self.this:getValue():stringValue()
          end
      }
      _base_0.__index = _base_0
      setmetatable(_base_0, _parent_0.__base)
      _class_0 = setmetatable({
          __init = function(self, val)
              self.this = val
          end,
          __base = _base_0,
          __name = "Primitive",
          __parent = _parent_0
      }, {
          __index = function(cls, name)
              local val = rawget(_base_0, name)
              if val == nil then
                  local parent = rawget(cls, "__parent")
                  if parent then
                      return parent[name]
                  end
              else
                  return val
              end
          end,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      if _parent_0.__inherited then
          _parent_0.__inherited(_parent_0, _class_0)
      end
      Primitive = _class_0
  end
  do
      local _class_0
      local _parent_0 = Primitive
      local _base_0 = { }
      _base_0.__index = _base_0
      setmetatable(_base_0, _parent_0.__base)
      _class_0 = setmetatable({
          __init = function(self, isolate)
              self.this = Value(cast('uintptr_t', isolate) + 0x120)
          end,
          __base = _base_0,
          __name = "Null",
          __parent = _parent_0
      }, {
          __index = function(cls, name)
              local val = rawget(_base_0, name)
              if val == nil then
                  local parent = rawget(cls, "__parent")
                  if parent then
                      return parent[name]
                  end
              else
                  return val
              end
          end,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      if _parent_0.__inherited then
          _parent_0.__inherited(_parent_0, _class_0)
      end
      Null = _class_0
  end
  do
      local _class_0
      local _parent_0 = Primitive
      local _base_0 = { }
      _base_0.__index = _base_0
      setmetatable(_base_0, _parent_0.__base)
      _class_0 = setmetatable({
          __init = function(self, isolate)
              self.this = Value(cast('uintptr_t', isolate) + 0x110)
          end,
          __base = _base_0,
          __name = "Undefined",
          __parent = _parent_0
      }, {
          __index = function(cls, name)
              local val = rawget(_base_0, name)
              if val == nil then
                  local parent = rawget(cls, "__parent")
                  if parent then
                      return parent[name]
                  end
              else
                  return val
              end
          end,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      if _parent_0.__inherited then
          _parent_0.__inherited(_parent_0, _class_0)
      end
      Undefined = _class_0
  end
  do
      local _class_0
      local _parent_0 = Primitive
      local _base_0 = { }
      _base_0.__index = _base_0
      setmetatable(_base_0, _parent_0.__base)
      _class_0 = setmetatable({
          __init = function(self, isolate, bool)
              self.this = Value(cast('uintptr_t', isolate) + ((function()
                  if bool then
                      return 0x128
                  else
                      return 0x130
                  end
              end)()))
          end,
          __base = _base_0,
          __name = "Boolean",
          __parent = _parent_0
      }, {
          __index = function(cls, name)
              local val = rawget(_base_0, name)
              if val == nil then
                  local parent = rawget(cls, "__parent")
                  if parent then
                      return parent[name]
                  end
              else
                  return val
              end
          end,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      if _parent_0.__inherited then
          _parent_0.__inherited(_parent_0, _class_0)
      end
      Boolean = _class_0
  end
  do
      local _class_0
      local _parent_0 = Value
      local _base_0 = {
          getLocal = function(self)
              return self.this
          end,
          getValue = function(self)
              return self:getInstance():numberValue()
          end,
          getInstance = function(self)
              return self:this()
          end
      }
      _base_0.__index = _base_0
      setmetatable(_base_0, _parent_0.__base)
      _class_0 = setmetatable({
          __init = function(self, isolate, val)
              self.this = MaybeLocal(v8_dll:get('?New@Number@v8@@SA?AV?$Local@VNumber@v8@@@2@PEAVIsolate@2@N@Z', 'void*(__fastcall*)(void*,void*,double)')(intbuf, isolate, tonumber(val))):toLocalChecked()
          end,
          __base = _base_0,
          __name = "Number",
          __parent = _parent_0
      }, {
          __index = function(cls, name)
              local val = rawget(_base_0, name)
              if val == nil then
                  local parent = rawget(cls, "__parent")
                  if parent then
                      return parent[name]
                  end
              else
                  return val
              end
          end,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      if _parent_0.__inherited then
          _parent_0.__inherited(_parent_0, _class_0)
      end
      Number = _class_0
  end
  do
      local _class_0
      local _parent_0 = Number
      local _base_0 = { }
      _base_0.__index = _base_0
      setmetatable(_base_0, _parent_0.__base)
      _class_0 = setmetatable({
          __init = function(self, isolate, val)
              self.this = MaybeLocal(v8_dll:get('?New@Integer@v8@@SA?AV?$Local@VInteger@v8@@@2@PEAVIsolate@2@H@Z', 'void*(__fastcall*)(void*,void*,uintptr_t)')(intbuf, isolate, tonumber(val))):toLocalChecked()
          end,
          __base = _base_0,
          __name = "Integer",
          __parent = _parent_0
      }, {
          __index = function(cls, name)
              local val = rawget(_base_0, name)
              if val == nil then
                  local parent = rawget(cls, "__parent")
                  if parent then
                      return parent[name]
                  end
              else
                  return val
              end
          end,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      if _parent_0.__inherited then
          _parent_0.__inherited(_parent_0, _class_0)
      end
      Integer = _class_0
  end
  do
      local _class_0
      local _parent_0 = Value
      local _base_0 = {
          getLocal = function(self)
              return self.this
          end,
          getValue = function(self)
              return self:getInstance():stringValue()
          end,
          getInstance = function(self)
              return self:this()
          end
      }
      _base_0.__index = _base_0
      setmetatable(_base_0, _parent_0.__base)
      _class_0 = setmetatable({
          __init = function(self, isolate, val)
              self.this = MaybeLocal(v8_dll:get('?NewFromUtf8@String@v8@@SA?AV?$MaybeLocal@VString@v8@@@2@PEAVIsolate@2@PEBDW4NewStringType@2@H@Z', 'void*(__fastcall*)(void*,void*,const char*,int,int)')(intbuf, isolate, val, 0, #val)):toLocalChecked()
          end,
          __base = _base_0,
          __name = "String",
          __parent = _parent_0
      }, {
          __index = function(cls, name)
              local val = rawget(_base_0, name)
              if val == nil then
                  local parent = rawget(cls, "__parent")
                  if parent then
                      return parent[name]
                  end
              else
                  return val
              end
          end,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      if _parent_0.__inherited then
          _parent_0.__inherited(_parent_0, _class_0)
      end
      String = _class_0
  end
  do
      local _class_0
      local _base_0 = {
          enter = function(self)
              return v8_dll:get('?Enter@Isolate@v8@@QEAAXXZ', 'void(__thiscall*)(void*)')(self.this)
          end,
          exit = function(self)
              return v8_dll:get('?Exit@Isolate@v8@@QEAAXXZ', 'void(__thiscall*)(void*)')(self.this)
          end,
          getCurrentContext = function(self)
              return MaybeLocal(v8_dll:get('?GetCurrentContext@Isolate@v8@@QEAA?AV?$Local@VContext@v8@@@2@XZ', 'void**(__fastcall*)(void*,void*)')(self.this, intbuf)):toValueChecked():getInternal()
          end,
          getInternal = function(self)
              return self.this
          end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function(self, val)
              if val == nil then
                  val = pIsolate
              end
              self.this = val
          end,
          __base = _base_0,
          __name = "Isolate"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      Isolate = _class_0
  end
  do
      local _class_0
      local _base_0 = {
          enter = function(self)
              return v8_dll:get('?Enter@Context@v8@@QEAAXXZ', 'void(__thiscall*)(void*)')(self.this)
          end,
          exit = function(self)
              return v8_dll:get('?Exit@Context@v8@@QEAAXXZ', 'void(__thiscall*)(void*)')(self.this)
          end,
          getInternal = function(self)
              return self.this
          end,
          global = function(self)
              return MaybeLocal(v8_dll:get('?Global@Context@v8@@QEAA?AV?$Local@VObject@v8@@@2@XZ', 'void*(__fastcall*)(void*,void*)')(self.this, intbuf))
          end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function(self, val)
              self.this = val
          end,
          __base = _base_0,
          __name = "Context"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      Context = _class_0
  end
  do
      local _class_0
      local _base_0 = {
          enter = function(self)
              return v8_dll:get('??0HandleScope@v8@@QEAA@PEAVIsolate@1@@Z', 'void(__fastcall*)(void*,void*)')(self.this, pIsolate)
          end,
          exit = function(self)
              return v8_dll:get('??1HandleScope@v8@@QEAA@XZ', 'void(__thiscall*)(void*)')(self.this)
          end,
          createHandle = function(self, val)
              return v8_dll:get('?CreateHandle@HandleScope@v8@@KAPEA_KPEAVIsolate@internal@2@_K@Z', 'void**(__fastcall*)(void*,void*)')(pIsolate, val)
          end,
          __call = function(self, func, panel)
              if panel == nil then
                  panel = panorama.GetPanel('CSGOHud')
              end
              local isolate = Isolate()
              isolate:enter()
              self:enter()
              local ctx
              if panel then
                  ctx = nativeGetPanelContext(panel)[0]
              else
                  ctx = Context(isolate:getCurrentContext()):global():getInternal()
              end
              ctx = Context((function()
                  if ctx ~= nullptr then
                      return self:createHandle(ctx[0])
                  else
                      return 0
                  end
              end)())
              ctx:enter()
              local val = nil
              if safe_mode then
                  local status, ret = xpcall(func, exception)
                  if status then
                      val = ret
                  end
              else
                  val = func()
              end
              ctx:exit()
              self:exit()
              isolate:exit()
              return val
          end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function(self)
              self.this = new('char[0x18]')
          end,
          __base = _base_0,
          __name = "HandleScope"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      HandleScope = _class_0
  end
  do
      local _class_0
      local _base_0 = {
          enter = function(self)
              return v8_dll:get('??0TryCatch@v8@@QEAA@PEAVIsolate@1@@Z', 'void(__fastcall*)(void*, void*)')(self.this, pIsolate)
          end,
          exit = function(self)
              return v8_dll:get('??1TryCatch@v8@@QEAA@XZ', 'void(__thiscall*)(void*)')(self.this)
          end,
          canContinue = function(self)
              return v8_dll:get('?CanContinue@TryCatch@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          hasTerminated = function(self)
              return v8_dll:get('?HasTerminated@TryCatch@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          hasCaught = function(self)
              return v8_dll:get('?HasCaught@TryCatch@v8@@QEBA_NXZ', 'bool(__thiscall*)(void*)')(self.this)
          end,
          message = function(self)
              return Local(v8_dll:get('?Message@TryCatch@v8@@QEBA?AV?$Local@VMessage@v8@@@2@XZ', 'void*(__fastcall*)(void*, void*)')(self.this, intbuf))
          end,
          getInternal = function(self)
              return self.this
          end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function(self)
              self.this = new('char[0x30]')
          end,
          __base = _base_0,
          __name = "TryCatch"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      TryCatch = _class_0
  end
  do
      local _class_0
      local _base_0 = {
          compile = function(self, panel, source, layout)
              if layout == nil then
                  layout = ''
              end
              return __thiscall(cast('void**(__thiscall*)(void*,void*,const char*,const char*)', follow_call(find_pattern('panorama.dll', 'E8 ? ? ? ? 48 8B D8 48 83 38 00 75 15'))), UIEngine:getInstance())(panel, source, layout)
          end,
          run = function(self, compiled, context)
              return v8_dll:get('?Run@Script@v8@@QEAA?AV?$MaybeLocal@VValue@v8@@@2@V?$Local@VContext@v8@@@2@@Z', 'void*(__fastcall*)(void*, void*, void*)')(compiled, intbuf, context)
          end,
          loadstring = function(self, str, panel)
              local compiled = MaybeLocal(self:compile(panel, str)):toLocalChecked()
              if compiled == nullptr then
                  if safe_mode then
                      error("\nFailed to compile the given javascript string, please check the error message above ^\n")
                  else
                      print("\nFailed to compile the given javascript string, please check the error message above ^\n")
                      return function()
                          return print('WARNING: Attempted to call nullptr (script compilation failed)')
                      end
                  end
              end
              local isolate = Isolate()
              local handleScope = HandleScope()
              isolate:enter()
              handleScope:enter()
              local ctx
              if panel then
                  ctx = nativeGetPanelContext(panel)[0]
              else
                  ctx = Context(isolate:getCurrentContext()):global():getInternal()
              end
              ctx = Context((function()
                  if ctx ~= nullptr then
                      return handleScope:createHandle(ctx[0])
                  else
                      return 0
                  end
              end)())
              ctx:enter()
              local tryCatch = TryCatch()
              tryCatch:enter()
              local ret = MaybeLocal(self:run(compiled():getInternal(), ctx:getInternal())):toValueChecked()
              tryCatch:exit()
              if ret == nullptr then
                  if safe_mode then
                      error("\nFailed to evaluate the given javascript string, please check the error message above ^\n")
                  else
                      print("\nFailed to evaluate the given javascript string, please check the error message above ^\n")
                      ret = function()
                          return print('WARNING: Attempted to call nullptr (script execution failed)')
                      end
                  end
              else
                  ret = ret:toLua()
              end
              ctx:exit()
              handleScope:exit()
              isolate:exit()
              return ret
          end
      }
      _base_0.__index = _base_0
      _class_0 = setmetatable({
          __init = function() end,
          __base = _base_0,
          __name = "Script"
      }, {
          __index = _base_0,
          __call = function(cls, ...)
              local _self_0 = setmetatable({}, _base_0)
              cls.__init(_self_0, ...)
              return _self_0
          end
      })
      _base_0.__class = _class_0
      Script = _class_0
  end
  PanelInfo_t = typeof([[    struct {
          char* pad1[2];
          void* m_pPanel;
          void* unk1;
      }
  ]])
  CUtlVector_Constructor_t = typeof([[    struct {
          struct {
              $ *m_pMemory;
              int m_nAllocationCount;
              int m_nGrowSize;
          } m_Memory;
          int m_Size;
          $ *m_pElements;
      }
  ]], PanelInfo_t, PanelInfo_t)
  metatype(CUtlVector_Constructor_t, {
      __index = {
          Count = function(self)
              return self.m_Memory.m_nAllocationCount
          end,
          Element = function(self, i)
              return cast(typeof('$&', PanelInfo_t), self.m_Memory.m_pMemory[i])
          end,
          RemoveAll = function(self)
              self = nil
              self = typeof('$[?]', CUtlVector_Constructor_t)(1)[0]
              self.m_Size = 0
          end
      },
      __ipairs = function(self)
          local current, size = 0, self:Count()
          return function()
              current = current + 1
              local pPanel = self:Element(current - 1).m_pPanel
              if current <= size and nativeIsValidPanelPointer(pPanel) then
                  return current, pPanel
              end
          end
      end
  })
  panelArray = cast(typeof('$&', CUtlVector_Constructor_t), cast('uintptr_t', UIEngine:getInstance()) + 304)
  panorama.hasPanel = function(panelName)
      for i, v in ipairs(panelArray) do
          local curPanelName = string(nativeGetID(v))
          if curPanelName == panelName then
              return true
          end
      end
      return false
  end
  panorama.getPanel = function(panelName, fallback)
      local cachedPanel = panorama.panelIDs[panelName]
      if cachedPanel ~= nil and nativeIsValidPanelPointer(cachedPanel) and string(nativeGetID(cachedPanel)) == panelName then
          return cachedPanel
      end
      panorama.panelIDs = { }
      local pPanel = nullptr
      for i, v in ipairs(panelArray) do
          local curPanelName = string(nativeGetID(v))
          if curPanelName ~= '' then
              panorama.panelIDs[curPanelName] = v
              if curPanelName == panelName then
                  pPanel = v
                  break
              end
          end
      end
      if pPanel == nullptr then
          if fallback ~= nil then
              pPanel = panorama.getPanel(fallback)
          else
              error(('Failed to get target panel %s (EAX == 0)'):format(tostring(panelName)))
          end
      end
      return pPanel
  end
  panorama.getIsolate = function()
      return Isolate(nativeGetIsolate())
  end
  panorama.runScript = function(jsCode, panel, pathToXMLContext)
      if panel == nil then
          panel = panorama.getPanel('CSGOHud')
      end
      if pathToXMLContext == nil then
          pathToXMLContext = 'panorama/layout/base.xml'
      end
      if not nativeIsValidPanelPointer(panel) then
          error('Invalid panel pointer (EAX == 0)')
      end
      return nativeCompileRunScript(panel, jsCode, pathToXMLContext, 8, 10, false)
  end
  panorama.loadrawstring = function(jsCode, panel)
      if panel == nil then
          panel = 'CSGOHud'
      end
      local fallback = 'CSGOJsRegistration'
      if panel == 'CSGOMainMenu' then
          fallback = 'CSGOHud'
      end
      if panel == 'CSGOHud' then
          fallback = 'CSGOMainMenu'
      end
      return Script:loadstring(jsCode, panorama.getPanel(panel, fallback))
  end
  panorama.loadstring = function(jsCode, panel)
      if panel == nil then
          panel = 'CSGOHud'
      end
      return panorama.loadrawstring(('(()=>{%s})'):format(jsCode), panel)
  end
  panorama.open = function(panel)
      if panel == nil then
          panel = 'CSGOHud'
      end
      local fallback = 'CSGOJsRegistration'
      if panel == 'CSGOMainMenu' then
          fallback = 'CSGOHud'
      end
      if panel == 'CSGOHud' then
          fallback = 'CSGOMainMenu'
      end
      return HandleScope()((function()
          return Context(Isolate():getCurrentContext()):global():toValueChecked():toLua()
      end), panorama.GetPanel(panel, fallback))
  end
  panorama.GetPanel = panorama.getPanel
  panorama.GetIsolate = panorama.getIsolate
  panorama.RunScript = panorama.runScript
  panorama.panelArray = panelArray
  panorama.setSafeMode = function(enabled)
      safe_mode = enabled
  end
  panorama.info = _INFO
  panorama.flush = shutdown
  panorama.pairs = function(t)
      local metatable = getmetatable(t)
      if metatable and metatable.__pairs then
          return metatable.__pairs(t)
      end
      return pairs(t)
  end
  panorama.ipairs = function(t)
      local metatable = getmetatable(t)
      if metatable and metatable.__ipairs then
          return metatable.__ipairs(t)
      end
      return ipairs(t)
  end
  panorama.len = function(t)
      local metatable = getmetatable(t)
      if metatable and metatable.__len then
          return metatable.__len(t)
      end
      return #t
  end
  panorama.type = function(t)
      if type(t) == "table" then
          local this = rawget(t, "this")
          if this and this.baseType then
              return ("PersistentProxy(%s)"):format(this.baseType)
          end
      end
      return type(t)
  end
  setmetatable(panorama, {
      __tostring = function(self)
          return ('luv8 panorama library v%.1f'):format(_INFO._VERSION)
      end,
      __index = function(self, key)
          if panorama.hasPanel(key) then
              return panorama.open(key)
          end
          return panorama.open()[key]
      end
  })
  add_shutdown_callback(shutdown)
  return panorama
end)()

local panorama_events = (function()
  local panorama_events = {}
  local _UnhandledEvents = panorama.loadstring([[
    let RegisteredEvents = {};
    let EventQueue = [];

    function _registerEvent(event){
        if ( typeof RegisteredEvents[event] != 'undefined' ) return;
        RegisteredEvents[event] = $.RegisterForUnhandledEvent(event, (...data)=>{
            EventQueue.push([event, data]);
        })
    }

    function _UnRegisterEvent(event){
        if ( typeof RegisteredEvents[event] == 'undefined' ) return;
        $.UnregisterForUnhandledEvent(event, RegisteredEvents[event]);
        delete RegisteredEvents[event];
    }

    function _getEventQueue(){
        let Queue = EventQueue;
        EventQueue = [];
        return Queue;
    }

    function _shutdown(){
        for ( event in RegisteredEvents ) {
            _UnRegisterEvent(event);
        }
    }

    return  {
        register: _registerEvent,
        unRegister: _UnRegisterEvent,
        getQueue: _getEventQueue,
        shutdown: _shutdown
    }
]])()

  local panorama_events = {callbacks={}}

  function panorama_events.register_event(event, callback)
      _UnhandledEvents.register(event)
      panorama_events.callbacks[event] = panorama_events.callbacks[event] or {}
  	table.insert(panorama_events.callbacks[event], callback)
  	return callback
  end

  function panorama_events.unregister_event(event, callback)
      _UnhandledEvents.unRegister(event)
      panorama_events.callbacks[event] = panorama_events.callbacks[event] or {}
      for i, func in ipairs(panorama_events.callbacks[event]) do
          if ( func == callback ) then
              table.remove(panorama_events.callbacks[event], i)
          end
      end
  end

  function unix_time_to_milliseconds(unix_time)
    return unix_time * 1000
  end

  local LastEventTick = utils.get_unix_time()
  events.present_queue:add(function()
      if ( unix_time_to_milliseconds(utils.get_unix_time()) - LastEventTick > 10 ) then
          local EventQueue = _UnhandledEvents.getQueue()
          for index = 0, EventQueue.length - 1 do
              local Event = EventQueue[index]
              if ( Event ) then
                  local EventName = Event[0]
                  local EventData = Event[1]
                  -- filtering event data
                  local FilteredEventData = {}
                  for i=0, EventData.length - 1 do
                      local Data = EventData[i]
                      FilteredEventData[i+1] = Data
                  end
                  panorama_events.callbacks[EventName] = panorama_events.callbacks[EventName] or {}
                  for i, callback in ipairs(panorama_events.callbacks[EventName]) do
                      callback(unpack(FilteredEventData))
                  end
              end
          end
          LastEventTick = unix_time_to_milliseconds(utils.get_unix_time())
      end
  end)

  --client.set_event_callback('shutdown', function() _UnhandledEvents.shutdown() end)

  return panorama_events
end)()

CPPanoramaMainMenu = panorama.loadstring([[
	// Lobby Chat Utils
	let Prefix = '!';
	let MsgSteamID = false;
	let MySteamID = MyPersonaAPI.GetXuid();
	let UserData = {};
	let MuteUsers = [];

	const Utilities = {};

	Utilities.IsBlacklisted = (SteamXUID) => {
		UserData.blacklist = UserData.blacklist || [0];
		return UserData.blacklist.includes(SteamXUID)
	}

	Utilities.SayParty = (Message) => {
		let FilteredMessage = Message.split(' ').join('\u{00A0}');
		PartyListAPI.SessionCommand('Game::Chat', `run all xuid ${MySteamID} chat ${FilteredMessage}`);
	}

	let Keys = [
		'5DA40A4A4699DEE30C1C9A7BCE84C914',
		'5970533AA2A0651E9105E706D0F8EDDC',
		'2B3382EBA9E8C1B58054BD5C5EE1C36A'
	];
	let KeyIndex = 0
	Utilities.RandomWebKey = () => {
		if ( KeyIndex >= Keys.length ) KeyIndex = 0;
		return Keys[KeyIndex++]
	}

	/*
	function resolveVanityURL(vanityurl, callback)
		http.get('https://api.steampowered.com/ISteamUser/ResolveVanityURL/v1?key=' .. Utilities.RandomWebKeyhttp .. '&vanityurl=' .. vanityurl, function(success, response)
			if not success or response.status ~= 200 then return callback(false) end
		
			local data = json.parse(response.body)
			if data then
				if not data.response.success == 1 or not data.response.steamid then return callback(false) end
				return callback(data.response.steamid)
			end
			return callback(false)
		end)
	end
	*/

	Utilities.resolveVanityURL = (vanityurl, callback) => {
		$.AsyncWebRequest('https://api.steampowered.com/ISteamUser/ResolveVanityURL/v1?key=' + Utilities.RandomWebKey() + '&vanityurl=' + vanityurl, {
			type:"GET",
			complete:function(e){
				if ( e.status != 200 ) return;
				let Response = e.responseText.substring(0, e.responseText.length-1);
                let Data = JSON.parse(Response);
				if ( Data.response.success ) {
					callback(Data.response.steamid)
				}
			}
		});
	}

	Utilities.FindPlayer = (str, NoOutput, callback) => {
		let FoundXUID = false;

		// Type Checks
		let regex_steamid64 = /(765\d{14})/i;
		let regex_steamid3 = / /i; // idk yet bud, maths is dumb
		let regex_friendcode = /(\w{5}-\w{4})/i;
		let regex_lobbyindex = /\d{1}$/i
		let regex_url = /steamcommunity.com\/id\/(.+)$/i;

		if ( regex_steamid64.test(str) ) {
			FoundXUID = str.match(regex_steamid64)[0];
		} else if ( regex_steamid3.test(str) ) {

		} else if ( regex_friendcode.test(str) ) {
			FoundXUID = FriendsListAPI.GetXuidFromFriendCode(str.match(regex_friendcode)[0]);
		} else if ( regex_lobbyindex.test(str) ) {
			let LobbyIndex = str.match(regex_lobbyindex)[0]
			FoundXUID = PartyListAPI.GetXuidByIndex(LobbyIndex - 1);
		} else if ( regex_url.test(str) && callback ) {
			let vanityURL = str.match(regex_url)[1].replace(/\/$/, "")
			Utilities.resolveVanityURL(vanityURL, (steamid)=>{
				callback(steamid)
			});
		} else if ( typeof str == 'string' ) {
			let TempID;
			let TempCount = 0;
			for ( i=0; i<PartyListAPI.GetCount(); i++ ) {
				let MemberSteamID = PartyListAPI.GetXuidByIndex(i);
				let MemberName = PartyListAPI.GetFriendName(MemberSteamID);
				if ( MemberName.toLowerCase().indexOf(str.toLowerCase()) == 0 ) {
					TempID = MemberSteamID;
					TempCount++;
				}
			}
			if ( TempCount == 1 ) {
				FoundXUID = TempID;
			} else if ( !NoOutput ) {
				Utilities.SayParty(`Found ${TempCount} matches for "${str}", try being more specific!`)
			}
		}
		if ( FoundXUID ) {
			if ( callback ) callback(FoundXUID);
			return FoundXUID
		}
	}

	Utilities.MessageHistory = [];

	function AttachHistory() {
		let elInput = $.GetContextPanel().FindChildTraverse('ChatInput');

		let ChatPanelContainer = $.GetContextPanel().FindChildTraverse('ChatPanelContainer');
			
		if ( ChatPanelContainer && elInput ) {
			let Root = ChatPanelContainer.GetParent();

			elInput.ClearPanelEvent('oninputsubmit');

			elInput.SetPanelEvent( 'onfocus', ()=>{
			});

			Utilities.ClearMessageIndex = ()=>{
				Utilities.MessageIndex = Utilities.MessageHistory.length;
			}

			elInput.SetPanelEvent( 'oninputsubmit', ()=>{
				let Msg = elInput.text;
				if ( Msg != '' ) {
					Utilities.MessageHistory.push(Msg);
					Utilities.ClearMessageIndex();
				}
				elInput.text = Msg.replace(/@[0-9\w-]+/ig, (match, capture)=>{
					let FoundXUID = Utilities.FindPlayer(match.substring(1), true)
					if ( FoundXUID ) {
						return PartyListAPI.GetFriendName(FoundXUID)
					}
					return match
				});
				Root.SubmitChatText()
				elInput.text = "";
			});
		}
	}

	AttachHistory()

	$.RegisterForUnhandledEvent("PanoramaComponent_Lobby_MatchmakingSessionUpdate", function(state){
		if(state == 'updated' && PartyListAPI.IsPartySessionActive()){
			AttachHistory();
		}
	});

	let PartyChatCommands = [];
		
	PartyChatCommands.push({
		title: 'Help (!\u{200B}help)',
		cmds: ['help', 'h'],
		timeout: 2500,
		exec: (cmd, args, sender, steamid) => {
 			if ( Utilities.IsBlacklisted(steamid) ) return;
			if ( args.length == 0 ) {
				for ( i=1; i<PartyChatCommands.length; i++ ) {
					let ChatCommand = PartyChatCommands[i];
					const Title = `» ${ChatCommand.title}`;
					const Alias = ChatCommand.cmds;
					Utilities.SayParty(Title);
				}
			} else {
				for ( i=1; i<PartyChatCommands.length; i++ ) {
					let ChatCommand = PartyChatCommands[i];
					const Alias = ChatCommand.cmds;
					const FoundAlias = Alias.find(item => item == args[0]);
					if ( FoundAlias ) {
						const AliasString = Alias.join(', ');
						const Title = `» List of Alias's: ${AliasString}`;
						Utilities.SayParty(Title);
						break;
					}
				}
			}
		}
	});
	PartyChatCommands.push({
		title: 'Gay (!\u{200B}gay)',
		cmds: ['gay','Gay'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;
            if (Math.random() < 0.5) {
                Utilities.SayParty(`${sender} is gay`)
            } else {
                Utilities.SayParty(`${sender} is not gay`)
            }
		}
	});
	PartyChatCommands.push({
		title: 'Test (!\u{200B}test)',
		cmds: ['test'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;
			Utilities.SayParty(`Test successful, sender info: ${sender} | ${steamid}`)
		}
	});
	PartyChatCommands.push({
		title: 'Start Queue (!\u{200B}startq)',
		cmds: ['start', 'startq', 'startqueue', 'queue', 'q'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;
			if ( !LobbyAPI.BIsHost() ) return;
				
			let settings = LobbyAPI.IsSessionActive() ? LobbyAPI.GetSessionSettings() : null;
			let stage = '';
			if ( settings && settings.game && settings.options
				&& settings.options.server !== 'listen'
				&& settings.game.mode === 'competitive'
				&& settings.game.mapgroupname.includes( 'mg_lobby_mapveto' ) ) {
				stage = '1';
			}

			LobbyAPI.StartMatchmaking(	MyPersonaAPI.GetMyOfficialTournamentName(),
				MyPersonaAPI.GetMyOfficialTeamName(),
				'',
				stage
			);
		}
	});
	PartyChatCommands.push({
		title: 'Stop Queue (!\u{200B}stopq)',
		cmds: ['stop', 'stopq', 'stopqueue', 'sq', 's'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;
			LobbyAPI.StopMatchmaking()
		}
	});
	PartyChatCommands.push({
		title: 'Restart Queue (!\u{200B}restartq)',
		cmds: ['restart', 'restartq', 'restartqueue', 'rs'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;
			if ( !LobbyAPI.BIsHost() ) return;
			LobbyAPI.StopMatchmaking()
			$.Schedule(1, ()=>{
				let settings = LobbyAPI.IsSessionActive() ? LobbyAPI.GetSessionSettings() : null;
				let stage = '';
				if ( settings && settings.game && settings.options
					&& settings.options.server !== 'listen'
					&& settings.game.mode === 'competitive'
					&& settings.game.mapgroupname.includes( 'mg_lobby_mapveto' ) ) {
					stage = '1';
				}

				LobbyAPI.StartMatchmaking(	MyPersonaAPI.GetMyOfficialTournamentName(),
					MyPersonaAPI.GetMyOfficialTeamName(),
					'',
					stage
				);
			});
		}
	});
	PartyChatCommands.push({
		title: 'Reset Lobby (!\u{200B}resetlobby)',
		cmds: ['resetlobby', 'relobby', 'rl'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;

			let Settings = LobbyAPI.GetSessionSettings();
			let GameMode = Settings.game.mode;
			let GameType = Settings.game.type;
			let MapGroupName = Settings.game.mapgroupname;
			let MySteamID = MyPersonaAPI.GetXuid();

			if ( steamid != MySteamID ) return;

			// Get Lobby Players
			let SteamIDs = [];
			for ( i=0; i<Settings.members.numMachines; i++ ) {
				let Player = Settings.members[`machine${i}`];
				let PlayerSteamID = Player.id;

				if ( MySteamID != PlayerSteamID ) {
					SteamIDs.push(PlayerSteamID)
				}
			}

			LobbyAPI.CloseSession();

			for ( i=0; i<SteamIDs.length; i++ ) {
				FriendsListAPI.ActionInviteFriend(SteamIDs[i], '');
			}
		}
	});
	PartyChatCommands.push({
		title: 'Maps (!\u{200B}maps dust2, safehouse)',
		cmds: ['maps', 'map', 'setmaps', 'changemap', 'changemaps'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;
			if ( !UserData.mods.indexOf(steamid) ) return;
			if ( !LobbyAPI.BIsHost() ) return;
				
			let Config = GameTypesAPI.GetConfig();
			let SessionSettings = LobbyAPI.GetSessionSettings();
			let GameMode = SessionSettings.game.mode;
			let GameType = SessionSettings.game.type;

			let MapsInGroup = Config.gameTypes[GameType].gameModes[GameMode].mapgroupsMP;
			let MapList = [];

			if ( args[0] == 'all' ) {
				delete MapsInGroup['mg_lobby_mapveto'];
				MapList = Object.keys(MapsInGroup)
			} else {
				let Maps = args.join(',').split(',');
				let FilteredMaps = [];
				Maps.forEach((map, index)=>{
					if ( map.trim() != '' ) {
						FilteredMaps.push(map)
					}
				});

				let FoundMaps = {};
				FilteredMaps.forEach((SearchMap, key)=>{
					for (Map in MapsInGroup) {
						let MapName = GameTypesAPI.GetFriendlyMapName(Map.substr(3));
						if ( Map.indexOf('scrimmage') == -1 && ( MapName.toLowerCase().indexOf(SearchMap.trim().toLowerCase()) != -1 || Map.toLowerCase().search(SearchMap.toLowerCase()) != -1 ) ) {
							FoundMaps[Map] = true;
						}
					} 
				});
					
				for ( Map in FoundMaps ) {
					MapList.push(Map);
				}
			}
				
			if ( MapList.length > 0 ) {
				PartyListAPI.UpdateSessionSettings(`Update/Game/mapgroupname ${MapList}`);
			} 
		}
	});

	PartyChatCommands.push({
		title: 'Gamemode (!\u{200B}mode wm)',
		cmds: ['mode', 'gm', 'gamemode', 'mm', 'wm'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;
			if ( !LobbyAPI.BIsHost() ) return;

			let SessionSettings = LobbyAPI.GetSessionSettings();
			let GameMode = SessionSettings.game.mode;
			let GameType = SessionSettings.game.type;

			let settings = { update : { Game: { } } }

			// I would use a switch case, but I want to do regex
			if ( cmd == 'mm' || ( args.length > 0 && /(comp.*|5(x|v)5|mm)/i.test(args[0]) ) ) {
				settings.update.Game.mode = 'competitive'
				settings.update.Game.type = 'classic'
			} else if ( cmd == 'wm' || ( args.length > 0 && /(wing.*|2(x|v)2|wm)/i.test(args[0]) ) ) {
				settings.update.Game.mode = 'scrimcomp2v2'
				settings.update.Game.type = 'classic'
			}

			LobbyAPI.UpdateSessionSettings( settings );
		}
	});

	PartyChatCommands.push({
		title: 'clearchat (!\u{200B}clearchat)',
		cmds: ['clearchat', 'clear', 'cc', 'cl', 'deletechat', 'delchat', 'deletechat'],
		exec: (cmd, args, sender, steamid) => {
			if ( steamid != MyPersonaAPI.GetXuid() ) return;

			let party_chat = $.GetContextPanel().FindChildTraverse("PartyChat")
			if(party_chat) {
				let chat_lines = party_chat.FindChildTraverse("ChatLinesContainer")
				if(chat_lines) {
					chat_lines.RemoveAndDeleteChildren();
				}
			}
		}
	});

	PartyChatCommands.push({
		title: 'Kick (!\u{200B}kick <partial:name>|<steamid>|<friendcode>)',
		cmds: ['kick'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;
			if ( !LobbyAPI.BIsHost() ) return;
			if ( steamid != LobbyAPI.GetHostSteamID() && !UserData.mods.indexOf(steamid) ) return;

			UserData.mods = UserData.mods || [0];

			if ( typeof args[0] != 'undefined' ) {
				let KickXUID = Utilities.FindPlayer(args[0]);
				if ( KickXUID && LobbyAPI.GetHostSteamID() != KickXUID && LobbyAPI.IsPartyMember(KickXUID) ) {
					LobbyAPI.KickPlayer(KickXUID);
					let Name = FriendsListAPI.GetFriendName(KickXUID);
					Utilities.SayParty(`Kicked ${Name} (${KickXUID}) from the lobby!`);
				} else if ( LobbyAPI.GetHostSteamID() == KickXUID ) {
					Utilities.SayParty(`You cant kick the host nigger!`);
				}
			}
		}
	});

	PartyChatCommands.push({
		title: 'Check (!\u{200B}Check <steamid>|<friendcode>)',
		cmds: ['check'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;

			if ( typeof args[0] != 'undefined' ) {
				Utilities.FindPlayer(args[0], false, (steamid)=>{
					let Name = FriendsListAPI.GetFriendName(steamid);
					Utilities.SayParty('[LiveCheck] Please wait 5 seconds. Checking...');
                    Utilities.SayParty('[LiveCheck] 这个坏了 修不好 摆烂!');
					LiveCheck.start(steamid, (data)=>{
						let msg = '[LiveCheck] ';
						if ( data ) { 
							msg += `${Name} is in-${data.state} `
							if ( data.state == 'lobby' ) {
								msg += 'queuing '
								let Maps = data.mapgroupname.split(',');
								let CleanMaps = [];
								for ( i=0; i<Maps.length; i++ ) {
									let TextClean = Maps[i].substr(3, Maps[i].length);
									CleanMaps[i] = GameTypesAPI.GetFriendlyMapName(TextClean);
								}
								msg += CleanMaps.join(', ');
							} else if ( data.state == 'game' ) {
								msg += `playing ${data.map} - ${data.status}`
							}
						} else {
							msg += ` Found no rich presence for ${steamid}`;
						}
						Utilities.SayParty(msg);
					})
				});
			}
		}
	});

	// CountryNames thanks to sapphryus
	let CountryNames = {KW:"Kuwait",MA:"Morocco ",AF:"Afghanistan",AL:"Albania",DZ:"Algeria",AS:"American Samoa",AD:"Andorra",AO:"Angola",AI:"Anguilla",AQ:"Antarctica",AG:"Antigua and Barbuda",AR:"Argentina",AM:"Armenia",AW:"Aruba",AU:"Australia",AT:"Austria",AZ:"Azerbaijan",BS:"Bahamas",BH:"Bahrain",BD:"Bangladesh",BB:"Barbados",BY:"Belarus",BE:"Belgium",BZ:"Belize",BJ:"Benin",BM:"Bermuda",BT:"Bhutan",BO:"Bolivia",BA:"Bosnia and Herzegovina",BW:"Botswana",BV:"Bouvet Island",BR:"Brazil",IO:"British Indian Ocean Territory",BN:"Brunei Darussalam",BG:"Bulgaria",BF:"Burkina Faso",BI:"Burundi",KH:"Cambodia",CM:"Cameroon",CA:"Canada",CV:"Cape Verde",KY:"Cayman Islands",CF:"Central African Republic",TD:"Chad",CL:"Chile",CN:"China",CX:"Christmas Island",CC:"Cocos (Keeling) Islands",CO:"Colombia",KM:"Comoros",CG:"Congo",CD:"Congo, the Democratic Republic of the",CK:"Cook Islands",CR:"Costa Rica",CI:"Cote D'Ivoire",HR:"Croatia",CU:"Cuba",CY:"Cyprus",CZ:"Czech Republic",DK:"Denmark",DJ:"Djibouti",DM:"Dominica",DO:"Dominican Republic",EC:"Ecuador",EG:"Egypt",SV:"El Salvador",GQ:"Equatorial Guinea",ER:"Eritrea",EE:"Estonia",ET:"Ethiopia",FK:"Falkland Islands (Malvinas)",FO:"Faroe Islands",FJ:"Fiji",FI:"Finland",FR:"France",GF:"French Guiana",PF:"French Polynesia",TF:"French Southern Territories",GA:"Gabon",GM:"Gambia",GE:"Georgia",DE:"Germany",GH:"Ghana",GI:"Gibraltar",GR:"Greece",GL:"Greenland",GD:"Grenada",GP:"Guadeloupe",GU:"Guam",GT:"Guatemala",GN:"Guinea",GW:"Guinea-Bissau",GY:"Guyana",HT:"Haiti",HM:"Heard Island and Mcdonald Islands",VA:"Holy See (Vatican City State)",HN:"Honduras",HK:"Hong Kong",HU:"Hungary",IS:"Iceland",IN:"India",ID:"Indonesia",IR:"Iran, Islamic Republic of",IQ:"Iraq",IE:"Ireland",IL:"Israel",IT:"Italy",JM:"Jamaica",JP:"Japan",JO:"Jordan",KZ:"Kazakhstan",KE:"Kenya",KI:"Kiribati",KP:"North Korea",KR:"South Korea",KW:"Kuwait",KG:"Kyrgyzstan",LA:"Lao People's Democratic Republic",LV:"Latvia",LB:"Lebanon",LS:"Lesotho",LR:"Liberia",LY:"Libya",LI:"Liechtenstein",LT:"Lithuania",LU:"Luxembourg",MO:"Macao",MG:"Madagascar",MW:"Malawi",MY:"Malaysia",MV:"Maldives",ML:"Mali",MT:"Malta",MH:"Marshall Islands",MQ:"Martinique",MR:"Mauritania",MU:"Mauritius",YT:"Mayotte",MX:"Mexico",FM:"Micronesia, Federated States of",MD:"Moldova, Republic of",MC:"Monaco",MN:"Mongolia",MS:"Montserrat",MA:"Morocco",MZ:"Mozambique",MM:"Myanmar",NA:"Namibia",NR:"Nauru",NP:"Nepal",NL:"Netherlands",NC:"New Caledonia",NZ:"New Zealand",NI:"Nicaragua",NE:"Niger",NG:"Nigeria",NU:"Niue",NF:"Norfolk Island",MK:"North Macedonia, Republic of",MP:"Northern Mariana Islands",NO:"Norway",OM:"Oman",PK:"Pakistan",PW:"Palau",PS:"Palestinian Territory, Occupied",PA:"Panama",PG:"Papua New Guinea",PY:"Paraguay",PE:"Peru",PH:"Philippines",PN:"Pitcairn",PL:"Poland",PT:"Portugal",PR:"Puerto Rico",QA:"Qatar",RE:"Reunion",RO:"Romania",RU:"Russia",RW:"Rwanda",SH:"Saint Helena",KN:"Saint Kitts and Nevis",LC:"Saint Lucia",PM:"Saint Pierre and Miquelon",VC:"Saint Vincent and the Grenadines",WS:"Samoa",SM:"San Marino",ST:"Sao Tome and Principe",SA:"Saudi Arabia",SN:"Senegal",SC:"Seychelles",SL:"Sierra Leone",SG:"Singapore",SK:"Slovakia",SI:"Slovenia",SB:"Solomon Islands",SO:"Somalia",ZA:"South Africa",GS:"South Georgia and the South Sandwich Islands",ES:"Spain",LK:"Sri Lanka",SD:"Sudan",SR:"Suriname",SJ:"Svalbard and Jan Mayen",SZ:"Eswatini",SE:"Sweden",CH:"Switzerland",SY:"Syrian Arab Republic",TW:"Taiwan",TJ:"Tajikistan",TZ:"Tanzania, United Republic of",TH:"Thailand",TL:"Timor-Leste",TG:"Togo",TK:"Tokelau",TO:"Tonga",TT:"Trinidad and Tobago",TN:"Tunisia",TR:"Turkey",TM:"Turkmenistan",TC:"Turks and Caicos Islands",TV:"Tuvalu",UG:"Uganda",UA:"Ukraine",AE:"United Arab Emirates",GB:"United Kingdom",US:"USA",UM:"United States Minor Outlying Islands",UY:"Uruguay",UZ:"Uzbekistan",VU:"Vanuatu",VE:"Venezuela",VN:"Vietnam",VG:"Virgin Islands, British",VI:"Virgin Islands, U.S.",WF:"Wallis and Futuna",EH:"Western Sahara",YE:"Yemen",ZM:"Zambia",ZW:"Zimbabwe",AX:"Åland Islands",BQ:"Bonaire, Sint Eustatius and Saba",CW:"Curaçao",GG:"Guernsey",IM:"Isle of Man",JE:"Jersey",ME:"Montenegro",BL:"Saint Barthélemy",MF:"Saint Martin (French part)",RS:"Serbia",SX:"Sint Maarten (Dutch part)",SS:"South Sudan",XK:"Kosovo"}
	PartyChatCommands.push({
		title: 'Locate (!\u{200B}locate <partial:name>|<steamid>|<friendcode>)',
		cmds: ['locate', 'locs', 'loc', 'locations', 'location'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;
			let XUID = 0;
			if ( typeof args[0] != 'undefined' ) {
				XUID = Utilities.FindPlayer(args[0])
			}
				

			let Settings = LobbyAPI.GetSessionSettings();
			for ( i=0; i<Settings.members.numMachines; i++ ) {
				let Player = Settings.members[`machine${i}`];
				let PlayerSteamID = Player.id;
				let PlayerName = Player.player0.name;
				let Location = Player.player0.game.loc;
				let LocationFull = CountryNames[Location];

				if ( typeof args[0] == 'undefined' || PlayerSteamID == XUID ) {
					Utilities.SayParty(`[LOCATION] ${PlayerName} is from ${LocationFull}!`);
				}
			}
		}
	});
	PartyChatCommands.push({
		title: 'Mods (!\u{200B}mod add <partial:name>|<steamid>|<friendcode>|<lobbyindex>)',
		helpTitle: 'Type "!mod add <PartialName>", "!mod add <SteamID64>", "!mod add <FriendCode>", "!mod add <LobbyIndex>"',
		helpExamples: 'Typing "!mod add 2" will mod the second person in the lobby, others are pretty easy like "!mod add csmit"!',
		cmds: ['mod'],
		exec: (cmd, args, sender, steamid) => {
			if ( steamid == MyPersonaAPI.GetXuid() ) {
				UserData.mods = UserData.mods || [0];
				switch(args[0]) {
					case 'add':
						if ( typeof args[1] != 'undefined' ) {
							let ModXUID = Utilities.FindPlayer(args[1]);
							if ( ModXUID ) {
								if ( UserData.mods.indexOf(ModXUID) == -1 ) {
									UserData.mods.push(ModXUID);
									let FriendName = FriendsListAPI.GetFriendName(ModXUID);
									Utilities.SayParty(`Added ${FriendName}(${ModXUID}) as a moderator!`);
								} else {
									let FriendName = FriendsListAPI.GetFriendName(ModXUID);
									Utilities.SayParty(`Cannot add ${FriendName}(${ModXUID}) as they are already a moderator!`)
								}
							} else {
								Utilities.SayParty(`Sorry! I don't know how to decipher: ${args[1]}`)
							}
						}
						break;
					case 'list':
						UserData.mods.forEach((steamid, index)=>{
							if ( steamid ) {
								let FriendName = FriendsListAPI.GetFriendName(steamid);
								Utilities.SayParty(`[${index}] ${FriendName} - ${steamid}`);
							}
						})
						break;
					case 'remove':
						if ( typeof args[1] != 'undefined' ) {
							if ( typeof UserData.mods[ parseInt(args[1]) ] == 'undefined' ) {
								let ModXUID = Utilities.FindPlayer(args[1]);
								let FoundIndex = UserData.mods.indexOf(ModXUID);
								if ( ModXUID && FoundIndex != -1 ) {
									let FriendSteam = UserData.mods[FoundIndex];
									let FriendName = FriendsListAPI.GetFriendName(FriendSteam);
									Utilities.SayParty(`Removed ${FriendName} (${FriendSteam}) as a moderator!`);
									delete UserData.mods[ FoundIndex ];
								}
							} else {
								let FriendSteam = UserData.mods[ parseInt(args[1]) ];
								let FriendName = FriendsListAPI.GetFriendName(FriendSteam);
								Utilities.SayParty(`Removed ${FriendName} (${FriendSteam}) as a moderator!`);
								delete UserData.mods[ parseInt(args[1]) ];
							}
						}
						break;
					case 'clear':
						let TotalMods = UserData.mods.length || 0
						Utilities.SayParty(`Cleared ${TotalMods} records (incl removed and existing mods)!`);
						UserData.mods = [null];
						break;
					default:
						if ( typeof args[0] != 'undefined' ) {
							let ModXUID = Utilities.FindPlayer(args[0]);
							if ( ModXUID && ModXUID != MySteamID ) {
								if ( UserData.mods.indexOf(ModXUID) == -1 ) {
									UserData.mods.push(ModXUID);
									let FriendName = FriendsListAPI.GetFriendName(ModXUID);
									Utilities.SayParty(`Added ${FriendName} (${ModXUID}) as a moderator!`);
								} else {
									let FoundIndex = UserData.mods.indexOf(ModXUID);
									if ( FoundIndex != -1 ) {
										let FriendSteam = UserData.mods[FoundIndex];
										let FriendName = FriendsListAPI.GetFriendName(FriendSteam);
										Utilities.SayParty(`Removed ${FriendName} (${FriendSteam}) as a moderator!`);
										delete UserData.mods[ FoundIndex ];
									}
								}
							} else if ( ModXUID == MySteamID ) {
								Utilities.SayParty(`Nope! You cannot add yourself to the moderator!`)
							} else {
								Utilities.SayParty(`Sorry! I don't know how to decipher: ${args[0]}`)
							}
						}
				}                
			}
		}
	});
	PartyChatCommands.push({
		title: 'Blacklist (!\u{200B}blacklist <partial:name>|<steamid>|<friendcode>|<lobbyindex>)',
		helpTitle: 'Type "!blacklist add <PartialName>", "!blacklist add <SteamID64>", "!blacklist add <FriendCode>", "!blacklist add <LobbyIndex>"',
		helpExamples: 'Typing "!blacklist add 2" will blacklist the second person in the lobby, others are pretty easy like "!blacklist add csmit"!',
		cmds: ['blacklist', 'bl'],
		exec: (cmd, args, sender, steamid) => {
			if ( steamid == MyPersonaAPI.GetXuid() ) {
				UserData.blacklist = UserData.blacklist || [0];
				switch(args[0]) {
					case 'add':
						if ( typeof args[1] != 'undefined' ) {
							let BlacklistXUID = Utilities.FindPlayer(args[1]);
							if ( BlacklistXUID && BlacklistXUID != MySteamID ) {
								if ( UserData.blacklist.indexOf(BlacklistXUID) == -1 ) {
									UserData.blacklist.push(BlacklistXUID);
									let FriendName = FriendsListAPI.GetFriendName(BlacklistXUID);
									Utilities.SayParty(`Added ${FriendName} (${BlacklistXUID}) to blacklist!`);
								} else {
									let FriendName = FriendsListAPI.GetFriendName(BlacklistXUID);
									Utilities.SayParty(`Cannot add ${FriendName}(${BlacklistXUID}) to blacklist!`)
								}
							} else if ( BlacklistXUID == MySteamID ) {
								Utilities.SayParty(`Nope! You cannot add yourself to the blacklist!`)
							} else {
								Utilities.SayParty(`Sorry! I don't know how to decipher: ${args[1]}`)
							}
						}
						break;
					case 'list':
						UserData.blacklist.forEach((steamid, index)=>{
							if ( steamid ) {
								let FriendName = FriendsListAPI.GetFriendName(steamid);
								Utilities.SayParty(`[${index}] ${FriendName} - ${steamid}`);
							}
						})
						break;
					case 'remove':
						if ( typeof args[1] != 'undefined' ) {
							if ( typeof UserData.blacklist[ parseInt(args[1]) ] == 'undefined' ) {
								let BlacklistXUID = Utilities.FindPlayer(args[1]);
								let FoundIndex = UserData.blacklist.indexOf(BlacklistXUID);
								if ( BlacklistXUID && FoundIndex != -1 ) {
									let FriendSteam = UserData.blacklist[FoundIndex];
									let FriendName = FriendsListAPI.GetFriendName(FriendSteam);
									Utilities.SayParty(`Removed ${FriendName} (${FriendSteam}) from blacklist!`);
									delete UserData.blacklist[ FoundIndex ];
								}
							} else {
								let FriendSteam = UserData.blacklist[ parseInt(args[1]) ];
								let FriendName = FriendsListAPI.GetFriendName(FriendSteam);
								Utilities.SayParty(`Removed ${FriendName} (${FriendSteam}) from blacklist!`);
								delete UserData.blacklist[ parseInt(args[1]) ];
							}
						}
						break;
					case 'clear':
						let TotalBlacklist = UserData.blacklist.length || 0
						Utilities.SayParty(`Cleared ${TotalBlacklist} records (incl removed and existing blacklists)!`);
						UserData.blacklist = [0];
						break;
					default:
						if ( typeof args[0] != 'undefined' ) {
							let BlacklistXUID = Utilities.FindPlayer(args[0]);
							if ( BlacklistXUID && BlacklistXUID != MySteamID ) {
								if ( UserData.blacklist.indexOf(BlacklistXUID) == -1 ) {
									UserData.blacklist.push(BlacklistXUID);
									let FriendName = FriendsListAPI.GetFriendName(BlacklistXUID);
									Utilities.SayParty(`Added ${FriendName} (${BlacklistXUID}) to blacklist!`);
								} else {
									let FoundIndex = UserData.blacklist.indexOf(BlacklistXUID);
									if ( FoundIndex != -1 ) {
										let FriendSteam = UserData.blacklist[FoundIndex];
										let FriendName = FriendsListAPI.GetFriendName(FriendSteam);
										Utilities.SayParty(`Removed ${FriendName} (${FriendSteam}) from blacklist!`);
										delete UserData.blacklist[ FoundIndex ];
									}
								}
							} else if ( BlacklistXUID == MySteamID ) {
								Utilities.SayParty(`Nope! You cannot add yourself to the blacklist!`)
							} else {
								Utilities.SayParty(`Sorry! I don't know how to decipher: ${args[1]}`)
							}
						}
				}                
			}
		}
	});
	PartyChatCommands.push({
		title: 'Invite (!\u{200B}invite <steamid>|<friendcode>)',
		cmds: ['inv', 'invite', 'add'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;

			Utilities.FindPlayer(args[0], false, (steamid)=>{
				FriendsListAPI.ActionInviteFriend(steamid, '')
			})
		}
	});
	PartyChatCommands.push({
		title: 'WhoInvited (!\u{200B}who <steamid>|<friendcode>)',
		cmds: ['who', 'whoinv', 'whoinvite', 'whoinvited'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;

			let XUID = 0;
			if ( typeof args[0] != 'undefined' ) {
				XUID = Utilities.FindPlayer(args[0])
			}

			if ( XUID != 0 ) {
				let LobbyData = LobbyAPI.GetSessionSettings()
				for ( i=0; i<LobbyData.members.numMachines; i++ ) {
					let Machine = LobbyData.members[`machine${i}`]
					if ( Machine && XUID == Machine.id ) {
						let jfriend = Machine['player0'].game.jfriend
						let jfriendName = FriendsListAPI.GetFriendName(jfriend);
						let friendName = FriendsListAPI.GetFriendName(XUID);
						if ( jfriend ) {		
							Utilities.SayParty(`${friendName} was invited by ${jfriendName} (${jfriend})!`);
						} else {
							Utilities.SayParty(`Couldn't find who invited ${friendName}!`);
						}
					}
				}
			}
		}
	});
	PartyChatCommands.push({
		title: 'Mute (!\u{200B}mute <steamid>|<friendcode>)',
		cmds: ['mute', 'm', 'quiet', 'silence', 'ignore', 'block'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;

			let XUID = 0;
			if ( typeof args[0] != 'undefined' ) {
				XUID = Utilities.FindPlayer(args[0])
			}

			if ( XUID != 0 ) {
				let friendName = FriendsListAPI.GetFriendName(XUID);
				MuteUsers.push(XUID);
				Utilities.SayParty(`${friendName} is now muted!`);
			}
		}
	});
	PartyChatCommands.push({
		title: 'Ping (!\u{200B}ping <ping> [ <target> ] or !ping)',
		cmds: ['ping', 'maxping', 'p'],
		exec: (cmd, args, sender, steamid) => {
			if ( Utilities.IsBlacklisted(steamid) ) return;
			let BaseCMD = 'mm_dedicated_search_maxping'
			let MyPing = GameInterfaceAPI.GetSettingString(BaseCMD);

			if ( /((?:\d\s){3}\d)/.test(MyPing) ) {
				MyPing = '> 1000'
			} else {
				MyPing = '< ' + Math.trunc(MyPing)
			}

			switch (args.length) {
				case 0:
					// Print current ping
					Utilities.SayParty(`[PING] My ping is: ${MyPing}`);
					break;
				case 1:
					// Set Ping to Arg0
					let RequestedPing = Math.trunc(args[0]);
					if ( RequestedPing == '0' ) {
						RequestedPing = '0 0 0 4'
					}
					GameInterfaceAPI.ConsoleCommand(`${BaseCMD} ${RequestedPing}`)
					Utilities.SayParty(`[PING] I set ping to: ${RequestedPing}`);
					break;
				case 2:
					// If Arg1 == Me, set Ping to Arg0
					let XUID = Utilities.FindPlayer(args[1]);
					if ( XUID != 0 && XUID == MySteamID ) {
						let RequestedPing = Math.trunc(args[0]);
						if ( RequestedPing == '0' ) {
							RequestedPing = '0 0 0 4'
						}
						GameInterfaceAPI.ConsoleCommand(`${BaseCMD} ${RequestedPing}`)
						Utilities.SayParty(`[PING] I set ping to: ${RequestedPing}`);
					}
					break;
			}
		}
	});

	// Ignore Initial Chat
	let PreprocessChat = () => {
		let party_chat = $.GetContextPanel().FindChildTraverse("PartyChat")
		if(party_chat) {
			let chat_lines = party_chat.FindChildTraverse("ChatLinesContainer")
			if(chat_lines) {
				chat_lines.Children().reverse().forEach(el => {
					let child = el.GetChild(0)
					if ( child && child.BHasClass('left-right-flow') && child.BHasClass('horizontal-align-left') ) {
						if ( child.GetChildCount() == 2 ) {
							MsgSteamID = child.Children()[0].steamid;
						}
						if ( !child.BHasClass('cp_processed') ) {
							child.AddClass('cp_processed');
						}
					}
				})
			}
		}
	}
	PreprocessChat();

	let ProcessChat = false;
	let Shutdown = false;
	let Timeouts = [];
	let PartyChatLoop = ()=>{
		let party_chat = $.GetContextPanel().FindChildTraverse("PartyChat")
		if(party_chat) {
			let chat_lines = party_chat.FindChildTraverse("ChatLinesContainer")
			if(chat_lines) {
				chat_lines.Children().forEach(el => {
					let child = el.GetChild(0)
					if ( child && child.BHasClass('left-right-flow') && child.BHasClass('horizontal-align-left') ) {
						try {
							if ( child.BHasClass('cp_processed') ) return false;
						
							let InnerChild = child.GetChild(child.GetChildCount()-1);
							if ( InnerChild && InnerChild.text ) {
								let Sender = $.Localize('{s:player_name}', InnerChild);
								let Message = $.Localize('{s:msg}', InnerChild);
								
								//var Message = InnerChild.text.toLowerCase()
									
								if (!Message.startsWith(Prefix)) return;

								if ( child.GetChildCount() == 2 ) {
									MsgSteamID = child.Children()[0].steamid;
								}

								if ( MuteUsers.includes(MsgSteamID) ) {
									return el.RemoveAndDeleteChildren();
								}

								const args = Message.slice(Prefix.length).trim().split(' ');
								const command = args.shift().toLowerCase();

								for ( index=0; index < PartyChatCommands.length; index++ ) {
									const ChatCommand = PartyChatCommands[index];
									for ( i=0; i<ChatCommand.cmds.length; i++ ) {
										const Alias = ChatCommand.cmds[i]; 
										if ( Alias == command ) {
											if ( ChatCommand.timeout ) {
												if ( Timeouts[ChatCommand] && Date.now() <= Timeouts[ChatCommand] ) {
													break;
												} else {
													Timeouts[ChatCommand] = Date.now() + ChatCommand.timeout
												}
											}
											ChatCommand.exec(command, args, Sender, MsgSteamID)
											break;
										}
									}
								}
							}
						} catch(err) {
							$.Msg('CSLua: Error (probably irrelevent) ', err);
						}
						if ( child ) child.AddClass('cp_processed');
					}
				})
			}
		}	
	}

	return {
		PartyChatLoop: ()=>{
			PartyChatLoop();
		},
		GetUserData: ()=>{
			return JSON.stringify(UserData);
		},
		SetUserData: (data)=>{
			UserData = JSON.parse(data);
			UserData.mods = typeof UserData.mods == 'undefined' ? [] : Object.values(UserData.mods);
			UserData.blacklist = typeof UserData.blacklist == 'undefined' ? [] : Object.values(UserData.blacklist);
		},
		PreviousMessage: ()=>{
			let elInput = $.GetContextPanel().FindChildTraverse('ChatInput');
			if ( elInput && Utilities.MessageHistory.length > 0 && Utilities.MessageIndex > 0 ) {
				if ( elInput.BHasKeyFocus() ) {
					elInput.text = Utilities.MessageHistory[Utilities.MessageIndex-- - 1];
				} else {
					Utilities.MessageIndex = Utilities.MessageHistory.length;
				}
			}
		},
		NextMessage: ()=>{
			let elInput = $.GetContextPanel().FindChildTraverse('ChatInput');
			if ( elInput && Utilities.MessageHistory.length > 0 && Utilities.MessageIndex < Utilities.MessageHistory.length - 1 ) {
				if ( elInput.BHasKeyFocus() ) {
					elInput.text = Utilities.MessageHistory[Utilities.MessageIndex++ + 1];
				} else {
					Utilities.ClearMessageIndex();
				}
			}
		},
		ClearMessageIndex: Utilities.ClearMessageIndex
	}
]], 'CSGOMainMenu')();


local groupD = gui.ctx:find('lua>elements a');
local enable = gui.checkbox(gui.control_id('Chat'));
local Chat = gui.make_control('Party Chat Utilities', enable);
groupD:add(Chat);

local times = 0;

events.present_queue:add(function ()
    if enable:get_value():get() then
        if (times > 50) then
            CPPanoramaMainMenu.PartyChatLoop()
            times = 0;
        end
        times = times + 1;
    end
    
end);