type usize = int
type i8 = int
type u8 = int
type i16 = int
type u16 = int
type i32 = int32
type u32 = int32
type i64 = int64
type u64 = int64
type c_ulong = int
type c_ulonglong = int64
type c_long = int
type c_void
type c_uint = int
type c_int = int
type c_ushort = int
type c_short = int
type c_char = i8
type clock_t = c_ulong
type time_t = c_long
type size_t = c_long
type suseconds_t = i32
type dev_t = i32
type ino_t = u64
type mode_t = u16
type nlink_t = u16
type blksize_t = i32
type rlim_t = u64
type pthread_key_t = c_ulong
type sigset_t = u32
type clockid_t = c_uint
type fsblkcnt_t = c_uint
type fsfilcnt_t = c_uint
type speed_t = c_ulong
type tcflag_t = c_ulong
type nl_item = c_int
type id_t = c_uint
type sem_t = c_int
type idtype_t = c_uint
type integer_t = c_int
type cpu_type_t = integer_t
type cpu_subtype_t = integer_t
type key_t = c_int
type sae_associd_t = u32
type sae_connid_t = u32
type socklen_t = c_int

let _utx_usersize : usize = 256
let _utx_linesize : usize = 32
let _utx_idsize : usize = 4
let _utx_hostsize : usize = 256
let empty : c_short = 0
let run_lvl : c_short = 1
let boot_time : c_short = 2
let old_time : c_short = 3
let new_time : c_short = 4
let init_process : c_short = 5
let login_process : c_short = 6
let user_process : c_short = 7
let dead_process : c_short = 8
let accounting : c_short = 9
let signature : c_short = 10
let shutdown_time : c_short = 11
let lc_collate_mask : c_int = 1 lsl 0
let lc_ctype_mask : c_int = 1 lsl 1
let lc_messages_mask : c_int = 1 lsl 2
let lc_monetary_mask : c_int = 1 lsl 3
let lc_numeric_mask : c_int = 1 lsl 4
let lc_time_mask : c_int = 1 lsl 5

let lc_all_mask : c_int =
  lc_collate_mask lor lc_ctype_mask lor lc_messages_mask lor lc_monetary_mask
  lor lc_numeric_mask lor lc_time_mask

let codeset : nl_item = 0
let d_t_fmt : nl_item = 1
let d_fmt : nl_item = 2
let t_fmt : nl_item = 3
let t_fmt_ampm : nl_item = 4
let am_str : nl_item = 5
let pm_str : nl_item = 6
let day_1 : nl_item = 7
let day_2 : nl_item = 8
let day_3 : nl_item = 9
let day_4 : nl_item = 10
let day_5 : nl_item = 11
let day_6 : nl_item = 12
let day_7 : nl_item = 13
let abday_1 : nl_item = 14
let abday_2 : nl_item = 15
let abday_3 : nl_item = 16
let abday_4 : nl_item = 17
let abday_5 : nl_item = 18
let abday_6 : nl_item = 19
let abday_7 : nl_item = 20
let mon_1 : nl_item = 21
let mon_2 : nl_item = 22
let mon_3 : nl_item = 23
let mon_4 : nl_item = 24
let mon_5 : nl_item = 25
let mon_6 : nl_item = 26
let mon_7 : nl_item = 27
let mon_8 : nl_item = 28
let mon_9 : nl_item = 29
let mon_10 : nl_item = 30
let mon_11 : nl_item = 31
let mon_12 : nl_item = 32
let abmon_1 : nl_item = 33
let abmon_2 : nl_item = 34
let abmon_3 : nl_item = 35
let abmon_4 : nl_item = 36
let abmon_5 : nl_item = 37
let abmon_6 : nl_item = 38
let abmon_7 : nl_item = 39
let abmon_8 : nl_item = 40
let abmon_9 : nl_item = 41
let abmon_10 : nl_item = 42
let abmon_11 : nl_item = 43
let abmon_12 : nl_item = 44
let clock_realtime : clockid_t = 0
let clock_monotonic : clockid_t = 6
let clock_process_cputime_id : clockid_t = 12
let clock_thread_cputime_id : clockid_t = 16
let era : nl_item = 45
let era_d_fmt : nl_item = 46
let era_d_t_fmt : nl_item = 47
let era_t_fmt : nl_item = 48
let alt_digits : nl_item = 49
let radixchar : nl_item = 50
let thousep : nl_item = 51
let yesexpr : nl_item = 52
let noexpr : nl_item = 53
let yesstr : nl_item = 54
let nostr : nl_item = 55
let crncystr : nl_item = 56
let d_md_order : nl_item = 57
let exit_failure : c_int = 1
let exit_success : c_int = 0
let rand_max : c_int = 2147483647
let eof : c_int = -1
let seek_set : c_int = 0
let seek_cur : c_int = 1
let seek_end : c_int = 2
let _iofbf : c_int = 0
let _ionbf : c_int = 2
let _iolbf : c_int = 1
let bufsiz : c_uint = 1024
let fopen_max : c_uint = 20
let filename_max : c_uint = 1024
let l_tmpnam : c_uint = 1024
let tmp_max : c_uint = 308915776
let _pc_link_max : c_int = 1
let _pc_max_canon : c_int = 2
let _pc_max_input : c_int = 3
let _pc_name_max : c_int = 4
let _pc_path_max : c_int = 5
let _pc_pipe_buf : c_int = 6
let _pc_chown_restricted : c_int = 7
let _pc_no_trunc : c_int = 8
let _pc_vdisable : c_int = 9
let o_dsync : c_int = 0x400000
let o_noctty : c_int = 0x20000
let o_cloexec : c_int = 0x1000000
let o_directory : c_int = 0x100000
let s_ififo : mode_t = 4096
let s_ifchr : mode_t = 8192
let s_ifblk : mode_t = 24576
let s_ifdir : mode_t = 16384
let s_ifreg : mode_t = 32768
let s_iflnk : mode_t = 40960
let s_ifsock : mode_t = 49152
let s_ifmt : mode_t = 61440
let s_iexec : mode_t = 64
let s_iwrite : mode_t = 128
let s_iread : mode_t = 256
let s_irwxu : mode_t = 448
let s_ixusr : mode_t = 64
let s_iwusr : mode_t = 128
let s_irusr : mode_t = 256
let s_irwxg : mode_t = 56
let s_ixgrp : mode_t = 8
let s_iwgrp : mode_t = 16
let s_irgrp : mode_t = 32
let s_irwxo : mode_t = 7
let s_ixoth : mode_t = 1
let s_iwoth : mode_t = 2
let s_iroth : mode_t = 4
let f_ok : c_int = 0
let r_ok : c_int = 4
let w_ok : c_int = 2
let x_ok : c_int = 1
let stdin_fileno : c_int = 0
let stdout_fileno : c_int = 1
let stderr_fileno : c_int = 2
let f_lock : c_int = 1
let f_test : c_int = 3
let f_tlock : c_int = 2
let f_ulock : c_int = 0
let f_getlk : c_int = 7
let f_setlk : c_int = 8
let f_setlkw : c_int = 9
let sighup : c_int = 1
let sigint : c_int = 2
let sigquit : c_int = 3
let sigill : c_int = 4
let sigabrt : c_int = 6
let sigemt : c_int = 7
let sigfpe : c_int = 8
let sigkill : c_int = 9
let sigsegv : c_int = 11
let sigpipe : c_int = 13
let sigalrm : c_int = 14
let sigterm : c_int = 15
let prot_none : c_int = 0
let prot_read : c_int = 1
let prot_write : c_int = 2
let prot_exec : c_int = 4
let pt_trace_me : c_int = 0
let pt_read_i : c_int = 1
let pt_read_d : c_int = 2
let pt_read_u : c_int = 3
let pt_write_i : c_int = 4
let pt_write_d : c_int = 5
let pt_write_u : c_int = 6
let pt_continue : c_int = 7
let pt_kill : c_int = 8
let pt_step : c_int = 9
let pt_attach : c_int = 10
let pt_detach : c_int = 11
let pt_sigexc : c_int = 12
let pt_thupdate : c_int = 13
let pt_attachexc : c_int = 14
let pt_forcequota : c_int = 30
let pt_deny_attach : c_int = 31
let pt_firstmach : c_int = 32
let map_file : c_int = 0x0000
let map_shared : c_int = 0x0001
let map_private : c_int = 0x0002
let map_fixed : c_int = 0x0010
let map_anon : c_int = 0x1000
let map_anonymous : c_int = map_anon
let vm_flags_fixed : c_int = 0x0000
let vm_flags_anywhere : c_int = 0x0001
let vm_flags_purgable : c_int = 0x0002
let vm_flags_random_addr : c_int = 0x0008
let vm_flags_no_cache : c_int = 0x0010
let vm_flags_resilient_codesign : c_int = 0x0020
let vm_flags_resilient_media : c_int = 0x0040
let vm_flags_overwrite : c_int = 0x4000
let vm_flags_superpage_mask : c_int = 0x70000
let vm_flags_return_data_addr : c_int = 0x100000
let vm_flags_return_4k_data_addr : c_int = 0x800000
let vm_flags_alias_mask : c_int = 0xff000000
let vm_flags_user_allocate : c_int = 0xff07401f
let vm_flags_user_map : c_int = 0xff97401f

let vm_flags_user_remap : c_int =
  vm_flags_fixed lor vm_flags_anywhere lor vm_flags_random_addr
  lor vm_flags_overwrite lor vm_flags_return_data_addr
  lor vm_flags_resilient_codesign

let vm_flags_superpage_shift : c_int = 16
let superpage_none : c_int = 0
let superpage_size_any : c_int = 1

let vm_flags_superpage_none : c_int =
  superpage_none lsl vm_flags_superpage_shift

let vm_flags_superpage_size_any : c_int =
  superpage_size_any lsl vm_flags_superpage_shift

let superpage_size_2mb : c_int = 2

let vm_flags_superpage_size_2mb : c_int =
  superpage_size_2mb lsl vm_flags_superpage_shift

let vm_memory_malloc : c_int = 1
let vm_memory_malloc_small : c_int = 2
let vm_memory_malloc_large : c_int = 3
let vm_memory_malloc_huge : c_int = 4
let vm_memory_sbrk : c_int = 5
let vm_memory_realloc : c_int = 6
let vm_memory_malloc_tiny : c_int = 7
let vm_memory_malloc_large_reusable : c_int = 8
let vm_memory_malloc_large_reused : c_int = 9
let vm_memory_analysis_tool : c_int = 10
let vm_memory_malloc_nano : c_int = 11
let vm_memory_mach_msg : c_int = 20
let vm_memory_iokit : c_int = 21
let vm_memory_stack : c_int = 30
let vm_memory_guard : c_int = 31
let vm_memory_shared_pmap : c_int = 32
let vm_memory_dylib : c_int = 33
let vm_memory_objc_dispatchers : c_int = 34
let vm_memory_unshared_pmap : c_int = 35
let vm_memory_appkit : c_int = 40
let vm_memory_foundation : c_int = 41
let vm_memory_coregraphics : c_int = 42
let vm_memory_coreservices : c_int = 43
let vm_memory_carbon : c_int = vm_memory_coreservices
let vm_memory_java : c_int = 44
let vm_memory_coredata : c_int = 45
let vm_memory_coredata_objectids : c_int = 46
let vm_memory_ats : c_int = 50
let vm_memory_layerkit : c_int = 51
let vm_memory_cgimage : c_int = 52
let vm_memory_tcmalloc : c_int = 53
let vm_memory_coregraphics_data : c_int = 54
let vm_memory_coregraphics_shared : c_int = 55
let vm_memory_coregraphics_framebuffers : c_int = 56
let vm_memory_coregraphics_backingstores : c_int = 57
let vm_memory_coregraphics_xalloc : c_int = 58
let vm_memory_coregraphics_misc : c_int = vm_memory_coregraphics
let vm_memory_dyld : c_int = 60
let vm_memory_dyld_malloc : c_int = 61
let vm_memory_sqlite : c_int = 62
let vm_memory_javascript_core : c_int = 63
let vm_memory_javascript_jit_executable_allocator : c_int = 64
let vm_memory_javascript_jit_register_file : c_int = 65
let vm_memory_glsl : c_int = 66
let vm_memory_opencl : c_int = 67
let vm_memory_coreimage : c_int = 68
let vm_memory_webcore_purgeable_buffers : c_int = 69
let vm_memory_imageio : c_int = 70
let vm_memory_coreprofile : c_int = 71
let vm_memory_assetsd : c_int = 72
let vm_memory_os_alloc_once : c_int = 73
let vm_memory_libdispatch : c_int = 74
let vm_memory_accelerate : c_int = 75
let vm_memory_coreui : c_int = 76
let vm_memory_coreuifile : c_int = 77
let vm_memory_genealogy : c_int = 78
let vm_memory_rawcamera : c_int = 79
let vm_memory_corpseinfo : c_int = 80
let vm_memory_asl : c_int = 81
let vm_memory_swift_runtime : c_int = 82
let vm_memory_swift_metadata : c_int = 83
let vm_memory_dhmm : c_int = 84
let vm_memory_scenekit : c_int = 86
let vm_memory_skywalk : c_int = 87
let vm_memory_application_specific_1 : c_int = 240
let vm_memory_application_specific_16 : c_int = 255

(* let map_failed: *mut c_void = !0 as *mut c_void *)

let mcl_current : c_int = 0x0001
let mcl_future : c_int = 0x0002
let ms_async : c_int = 0x0001
let ms_invalidate : c_int = 0x0002
let ms_sync : c_int = 0x0010
let ms_killpages : c_int = 0x0004
let ms_deactivate : c_int = 0x0008
let eperm : c_int = 1
let enoent : c_int = 2
let esrch : c_int = 3
let eintr : c_int = 4
let eio : c_int = 5
let enxio : c_int = 6
let e2big : c_int = 7
let enoexec : c_int = 8
let ebadf : c_int = 9
let echild : c_int = 10
let edeadlk : c_int = 11
let enomem : c_int = 12
let eacces : c_int = 13
let efault : c_int = 14
let enotblk : c_int = 15
let ebusy : c_int = 16
let eexist : c_int = 17
let exdev : c_int = 18
let enodev : c_int = 19
let enotdir : c_int = 20
let eisdir : c_int = 21
let einval : c_int = 22
let enfile : c_int = 23
let emfile : c_int = 24
let enotty : c_int = 25
let etxtbsy : c_int = 26
let efbig : c_int = 27
let enospc : c_int = 28
let espipe : c_int = 29
let erofs : c_int = 30
let emlink : c_int = 31
let epipe : c_int = 32
let edom : c_int = 33
let erange : c_int = 34
let eagain : c_int = 35
let ewouldblock : c_int = eagain
let einprogress : c_int = 36
let ealready : c_int = 37
let enotsock : c_int = 38
let edestaddrreq : c_int = 39
let emsgsize : c_int = 40
let eprototype : c_int = 41
let enoprotoopt : c_int = 42
let eprotonosupport : c_int = 43
let esocktnosupport : c_int = 44
let enotsup : c_int = 45
let epfnosupport : c_int = 46
let eafnosupport : c_int = 47
let eaddrinuse : c_int = 48
let eaddrnotavail : c_int = 49
let enetdown : c_int = 50
let enetunreach : c_int = 51
let enetreset : c_int = 52
let econnaborted : c_int = 53
let econnreset : c_int = 54
let enobufs : c_int = 55
let eisconn : c_int = 56
let enotconn : c_int = 57
let eshutdown : c_int = 58
let etoomanyrefs : c_int = 59
let etimedout : c_int = 60
let econnrefused : c_int = 61
let eloop : c_int = 62
let enametoolong : c_int = 63
let ehostdown : c_int = 64
let ehostunreach : c_int = 65
let enotempty : c_int = 66
let eproclim : c_int = 67
let eusers : c_int = 68
let edquot : c_int = 69
let estale : c_int = 70
let eremote : c_int = 71
let ebadrpc : c_int = 72
let erpcmismatch : c_int = 73
let eprogunavail : c_int = 74
let eprogmismatch : c_int = 75
let eprocunavail : c_int = 76
let enolck : c_int = 77
let enosys : c_int = 78
let eftype : c_int = 79
let eauth : c_int = 80
let eneedauth : c_int = 81
let epwroff : c_int = 82
let edeverr : c_int = 83
let eoverflow : c_int = 84
let ebadexec : c_int = 85
let ebadarch : c_int = 86
let eshlibvers : c_int = 87
let ebadmacho : c_int = 88
let ecanceled : c_int = 89
let eidrm : c_int = 90
let enomsg : c_int = 91
let eilseq : c_int = 92
let enoattr : c_int = 93
let ebadmsg : c_int = 94
let emultihop : c_int = 95
let enodata : c_int = 96
let enolink : c_int = 97
let enosr : c_int = 98
let enostr : c_int = 99
let eproto : c_int = 100
let etime : c_int = 101
let eopnotsupp : c_int = 102
let enopolicy : c_int = 103
let enotrecoverable : c_int = 104
let eownerdead : c_int = 105
let eqfull : c_int = 106
let elast : c_int = 106
let eai_again : c_int = 2
let eai_badflags : c_int = 3
let eai_fail : c_int = 4
let eai_family : c_int = 5
let eai_memory : c_int = 6
let eai_nodata : c_int = 7
let eai_noname : c_int = 8
let eai_service : c_int = 9
let eai_socktype : c_int = 10
let eai_system : c_int = 11
let eai_overflow : c_int = 14
let f_dupfd : c_int = 0
let f_dupfd_cloexec : c_int = 67
let f_getfd : c_int = 1
let f_setfd : c_int = 2
let f_getfl : c_int = 3
let f_setfl : c_int = 4
let f_preallocate : c_int = 42
let f_rdadvise : c_int = 44
let f_rdahead : c_int = 45
let f_nocache : c_int = 48
let f_getpath : c_int = 50
let f_fullfsync : c_int = 51
let f_freeze_fs : c_int = 53
let f_thaw_fs : c_int = 54
let f_global_nocache : c_int = 55
let f_nodirect : c_int = 62
let f_allocatecontig : c_uint = 0x02
let f_allocateall : c_uint = 0x04
let f_peofposmode : c_int = 3
let f_volposmode : c_int = 4
let at_fdcwd : c_int = -2
let at_eaccess : c_int = 0x0010
let at_symlink_nofollow : c_int = 0x0020
let at_symlink_follow : c_int = 0x0040
let at_removedir : c_int = 0x0080
let tiocmodg : c_ulong = 0x40047403
let tiocmods : c_ulong = 0x80047404
let tiocm_le : c_int = 0x1
let tiocm_dtr : c_int = 0x2
let tiocm_rts : c_int = 0x4
let tiocm_st : c_int = 0x8
let tiocm_sr : c_int = 0x10
let tiocm_cts : c_int = 0x20
let tiocm_car : c_int = 0x40
let tiocm_cd : c_int = 0x40
let tiocm_rng : c_int = 0x80
let tiocm_ri : c_int = 0x80
let tiocm_dsr : c_int = 0x100
let tiocexcl : c_int = 0x2000740d
let tiocnxcl : c_int = 0x2000740e
let tiocflush : c_ulong = 0x80047410
let tiocgetd : c_ulong = 0x4004741a
let tiocsetd : c_ulong = 0x8004741b
let tiocixon : c_uint = 0x20007481
let tiocixoff : c_uint = 0x20007480
let tiocsbrk : c_uint = 0x2000747b
let tioccbrk : c_uint = 0x2000747a
let tiocsdtr : c_uint = 0x20007479
let tioccdtr : c_uint = 0x20007478
let tiocgpgrp : c_ulong = 0x40047477
let tiocspgrp : c_ulong = 0x80047476
let tiocoutq : c_ulong = 0x40047473
let tiocsti : c_ulong = 0x80017472
let tiocnotty : c_uint = 0x20007471
let tiocpkt : c_ulong = 0x80047470
let tiocpkt_data : c_int = 0x0
let tiocpkt_flushread : c_int = 0x1
let tiocpkt_flushwrite : c_int = 0x2
let tiocpkt_stop : c_int = 0x4
let tiocpkt_start : c_int = 0x8
let tiocpkt_nostop : c_int = 0x10
let tiocpkt_dostop : c_int = 0x20
let tiocpkt_ioctl : c_int = 0x40
let tiocstop : c_uint = 0x2000746f
let tiocstart : c_uint = 0x2000746e
let tiocmset : c_ulong = 0x8004746d
let tiocmbis : c_ulong = 0x8004746c
let tiocmbic : c_ulong = 0x8004746b
let tiocmget : c_ulong = 0x4004746a
let tiocremote : c_ulong = 0x80047469
let tiocgwinsz : c_ulong = 0x40087468
let tiocswinsz : c_ulong = 0x80087467
let tiocucntl : c_ulong = 0x80047466
let tiocstat : c_uint = 0x20007465
let tiocscons : c_uint = 0x20007463
let tioccons : c_ulong = 0x80047462
let tiocsctty : c_uint = 0x20007461
let tiocext : c_ulong = 0x80047460
let tiocsig : c_uint = 0x2000745f
let tiocdrain : c_uint = 0x2000745e
let tiocmsdtrwait : c_ulong = 0x8004745b
let tiocmgdtrwait : c_ulong = 0x4004745a
let tiocsdrainwait : c_ulong = 0x80047457
let tiocgdrainwait : c_ulong = 0x40047456
let tiocdsimicrocode : c_uint = 0x20007455
let tiocptygrant : c_uint = 0x20007454
let tiocptygname : c_uint = 0x40807453
let tiocptyunlk : c_uint = 0x20007452
let biocgrsig : c_ulong = 0x40044272
let biocsrsig : c_ulong = 0x80044273
let biocsdlt : c_ulong = 0x80044278
let biocgseesent : c_ulong = 0x40044276
let biocsseesent : c_ulong = 0x80044277
let biocgdltlist : c_ulong = 0xc00c4279
let fiodtype : c_ulong = 0x4004667a
let b0 : speed_t = 0
let b50 : speed_t = 50
let b75 : speed_t = 75
let b110 : speed_t = 110
let b134 : speed_t = 134
let b150 : speed_t = 150
let b200 : speed_t = 200
let b300 : speed_t = 300
let b600 : speed_t = 600
let b1200 : speed_t = 1200
let b1800 : speed_t = 1800
let b2400 : speed_t = 2400
let b4800 : speed_t = 4800
let b9600 : speed_t = 9600
let b19200 : speed_t = 19200
let b38400 : speed_t = 38400
let b7200 : speed_t = 7200
let b14400 : speed_t = 14400
let b28800 : speed_t = 28800
let b57600 : speed_t = 57600
let b76800 : speed_t = 76800
let b115200 : speed_t = 115200
let b230400 : speed_t = 230400
let exta : speed_t = 19200
let extb : speed_t = 38400
let sigtrap : c_int = 5
let glob_append : c_int = 0x0001
let glob_dooffs : c_int = 0x0002
let glob_err : c_int = 0x0004
let glob_mark : c_int = 0x0008
let glob_nocheck : c_int = 0x0010
let glob_nosort : c_int = 0x0020
let glob_noescape : c_int = 0x2000
let glob_nospace : c_int = -1
let glob_aborted : c_int = -2
let glob_nomatch : c_int = -3
let posix_madv_normal : c_int = 0
let posix_madv_random : c_int = 1
let posix_madv_sequential : c_int = 2
let posix_madv_willneed : c_int = 3
let posix_madv_dontneed : c_int = 4
let _sc_iov_max : c_int = 56
let _sc_getgr_r_size_max : c_int = 70
let _sc_getpw_r_size_max : c_int = 71
let _sc_login_name_max : c_int = 73
let _sc_mq_prio_max : c_int = 75
let _sc_thread_attr_stackaddr : c_int = 82
let _sc_thread_attr_stacksize : c_int = 83
let _sc_thread_destructor_iterations : c_int = 85
let _sc_thread_keys_max : c_int = 86
let _sc_thread_prio_inherit : c_int = 87
let _sc_thread_prio_protect : c_int = 88
let _sc_thread_priority_scheduling : c_int = 89
let _sc_thread_process_shared : c_int = 90
let _sc_thread_safe_functions : c_int = 91
let _sc_thread_stack_min : c_int = 93
let _sc_thread_threads_max : c_int = 94
let _sc_threads : c_int = 96
let _sc_tty_name_max : c_int = 101
let _sc_atexit_max : c_int = 107
let _sc_xopen_crypt : c_int = 108
let _sc_xopen_enh_i18n : c_int = 109
let _sc_xopen_legacy : c_int = 110
let _sc_xopen_realtime : c_int = 111
let _sc_xopen_realtime_threads : c_int = 112
let _sc_xopen_shm : c_int = 113
let _sc_xopen_unix : c_int = 115
let _sc_xopen_version : c_int = 116
let _sc_xopen_xcu_version : c_int = 121
let _sc_phys_pages : c_int = 200
let pthread_process_private : c_int = 2
let pthread_process_shared : c_int = 1
let pthread_create_joinable : c_int = 1
let pthread_create_detached : c_int = 2
let pthread_stack_min : size_t = 8192
let rlimit_cpu : c_int = 0
let rlimit_fsize : c_int = 1
let rlimit_data : c_int = 2
let rlimit_stack : c_int = 3
let rlimit_core : c_int = 4
let rlimit_as : c_int = 5
let rlimit_rss : c_int = rlimit_as
let rlimit_memlock : c_int = 6
let rlimit_nproc : c_int = 7
let rlimit_nofile : c_int = 8
let rlim_nlimits : c_int = (9 [@deprecated "not stable across os versions"])
let _rlimit_posix_flag : c_int = 0x1000
let rlim_infinity : rlim_t = 0x7fff_ffff_ffff_ffffL
let rusage_self : c_int = 0
let rusage_children : c_int = -1
let madv_normal : c_int = 0
let madv_random : c_int = 1
let madv_sequential : c_int = 2
let madv_willneed : c_int = 3
let madv_dontneed : c_int = 4
let madv_free : c_int = 5
let madv_zero_wired_pages : c_int = 6
let madv_free_reusable : c_int = 7
let madv_free_reuse : c_int = 8
let madv_can_reuse : c_int = 9
let mincore_incore : c_int = 0x1
let mincore_referenced : c_int = 0x2
let mincore_modified : c_int = 0x4
let mincore_referenced_other : c_int = 0x8
let mincore_modified_other : c_int = 0x10

(* sys/netinet/in.h
   protocols (rfc 1700)
*)

(** ip6 hop-by-hop options *)
let ipproto_hopopts : c_int = 0

(** group mgmt protocol *)
let ipproto_igmp : c_int = 2

(** gateway<sup>2</sup> (deprecated) *)
let ipproto_ggp : c_int = 3

(** for compatibility *)
let ipproto_ipip : c_int = 4

(** stream protocol ii. *)
let ipproto_st : c_int = 7

(** exterior gateway protocol *)
let ipproto_egp : c_int = 8

(** private interior gateway *)
let ipproto_pigp : c_int = 9

(** bbn rcc monitoring *)
let ipproto_rccmon : c_int = 10

(** network voice protocol *)
let ipproto_nvpii : c_int = 11

(** pup *)
let ipproto_pup : c_int = 12

(** argus *)
let ipproto_argus : c_int = 13

(** emcon *)
let ipproto_emcon : c_int = 14

(** cross net debugger *)
let ipproto_xnet : c_int = 15

(** chaos *)
let ipproto_chaos : c_int = 16

(** multiplexing *)
let ipproto_mux : c_int = 18

(** dcn measurement subsystems *)
let ipproto_meas : c_int = 19

(** host monitoring *)
let ipproto_hmp : c_int = 20

(** packet radio measurement *)
let ipproto_prm : c_int = 21

(** xns idp *)
let ipproto_idp : c_int = 22

(** trunk-1 *)
let ipproto_trunk1 : c_int = 23

(** trunk-2 *)
let ipproto_trunk2 : c_int = 24

(** leaf-1 *)
let ipproto_leaf1 : c_int = 25

(** leaf-2 *)
let ipproto_leaf2 : c_int = 26

(** reliable data *)
let ipproto_rdp : c_int = 27

(** reliable transaction *)
let ipproto_irtp : c_int = 28

(** tp-4 w/ class negotiation *)
let ipproto_tp : c_int = 29

(** bulk data transfer *)
let ipproto_blt : c_int = 30

(** network services *)
let ipproto_nsp : c_int = 31

(** merit internodal *)
let ipproto_inp : c_int = 32

(** sequential exchange *)
let ipproto_sep : c_int = 33

(** third party connect *)
let ipproto_3pc : c_int = 34

(** interdomain policy routing *)
let ipproto_idpr : c_int = 35

(** xtp *)
let ipproto_xtp : c_int = 36

(** datagram delivery *)
let ipproto_ddp : c_int = 37

(** control message transport *)
let ipproto_cmtp : c_int = 38

(** tp++ transport *)
let ipproto_tpxx : c_int = 39

(** il transport protocol *)
let ipproto_il : c_int = 40

(** source demand routing *)
let ipproto_sdrp : c_int = 42

(** ip6 routing header *)
let ipproto_routing : c_int = 43

(** ip6 fragmentation header *)
let ipproto_fragment : c_int = 44

(** interdomain routing *)
let ipproto_idrp : c_int = 45

(** resource reservation *)
let ipproto_rsvp : c_int = 46

(** general routing encap. *)
let ipproto_gre : c_int = 47

(** mobile host routing *)
let ipproto_mhrp : c_int = 48

(** bha *)
let ipproto_bha : c_int = 49

(** ip6 encap sec. payload *)
let ipproto_esp : c_int = 50

(** ip6 auth header *)
let ipproto_ah : c_int = 51

(** integ. net layer security *)
let ipproto_inlsp : c_int = 52

(** ip with encryption *)
let ipproto_swipe : c_int = 53

(** next hop resolution *)
let ipproto_nhrp : c_int = 54

(** ip6 no next header *)
let ipproto_none : c_int = 59

(** ip6 destination option *)
let ipproto_dstopts : c_int = 60

(** any host internal protocol *)
let ipproto_ahip : c_int = 61

(** cftp *)
let ipproto_cftp : c_int = 62

(** "hello" routing protocol *)
let ipproto_hello : c_int = 63

(** satnet/backroom expak *)
let ipproto_satexpak : c_int = 64

(** kryptolan *)
let ipproto_kryptolan : c_int = 65

(** remote virtual disk *)
let ipproto_rvd : c_int = 66

(** pluribus packet core *)
let ipproto_ippc : c_int = 67

(** any distributed fs *)
let ipproto_adfs : c_int = 68

(** satnet monitoring *)
let ipproto_satmon : c_int = 69

(** visa protocol *)
let ipproto_visa : c_int = 70

(** packet core utility *)
let ipproto_ipcv : c_int = 71

(** comp. prot. net. executive *)
let ipproto_cpnx : c_int = 72

(** comp. prot. heartbeat *)
let ipproto_cphb : c_int = 73

(** wang span network *)
let ipproto_wsn : c_int = 74

(** packet video protocol *)
let ipproto_pvp : c_int = 75

(** backroom satnet monitoring *)
let ipproto_brsatmon : c_int = 76

(** sun net disk proto (temp.) *)
let ipproto_nd : c_int = 77

(** wideband monitoring *)
let ipproto_wbmon : c_int = 78

(** wideband expak *)
let ipproto_wbexpak : c_int = 79

(** iso cnlp *)
let ipproto_eon : c_int = 80

(** vmtp *)
let ipproto_vmtp : c_int = 81

(** secure vmtp *)
let ipproto_svmtp : c_int = 82

(** banyon vines *)
let ipproto_vines : c_int = 83

(** ttp *)
let ipproto_ttp : c_int = 84

(** nsfnet-igp *)
let ipproto_igp : c_int = 85

(** dissimilar gateway prot. *)
let ipproto_dgp : c_int = 86

(** tcf *)
let ipproto_tcf : c_int = 87

(** cisco/gxs igrp *)
let ipproto_igrp : c_int = 88

(** ospfigp *)
let ipproto_ospfigp : c_int = 89

(** strite rpc protocol *)
let ipproto_srpc : c_int = 90

(** locus address resoloution *)
let ipproto_larp : c_int = 91

(** multicast transport *)
let ipproto_mtp : c_int = 92

(** ax.25 frames *)
let ipproto_ax25 : c_int = 93

(** ip encapsulated in ip *)
let ipproto_ipeip : c_int = 94

(** mobile int.ing control *)
let ipproto_micp : c_int = 95

(** semaphore comm. security *)
let ipproto_sccsp : c_int = 96

(** ethernet ip encapsulation *)
let ipproto_etherip : c_int = 97

(** encapsulation header *)
let ipproto_encap : c_int = 98

(** any private encr. scheme *)
let ipproto_apes : c_int = 99

(** gmtp *)
let ipproto_gmtp : c_int = 100

(* /* 101-254: partly unassigned */ *)

(** protocol independent mcast *)
let ipproto_pim : c_int = 103

(** payload compression (ipcomp) *)
let ipproto_ipcomp : c_int = 108

(** pgm *)
let ipproto_pgm : c_int = 113

(** sctp *)
let ipproto_sctp : c_int = 132

(* /* 255: reserved */ *)
(* /* bsd private, local use, namespace incursion */ *)

(** divert pseudo-protocol *)
let ipproto_divert : c_int = 254

(** raw ip packet *)
let ipproto_raw : c_int = 255

let ipproto_max : c_int = 256

(** last return value of *_input(), meaning "all job for this pkt is done". *)
let ipproto_done : c_int = 257

let af_unspec : c_int = 0
let af_local : c_int = 1
let af_unix : c_int = af_local
let af_inet : c_int = 2
let af_implink : c_int = 3
let af_pup : c_int = 4
let af_chaos : c_int = 5
let af_ns : c_int = 6
let af_iso : c_int = 7
let af_osi : c_int = af_iso
let af_ecma : c_int = 8
let af_datakit : c_int = 9
let af_ccitt : c_int = 10
let af_sna : c_int = 11
let af_decnet : c_int = 12
let af_dli : c_int = 13
let af_lat : c_int = 14
let af_hylink : c_int = 15
let af_appletalk : c_int = 16
let af_route : c_int = 17
let af_link : c_int = 18
let pseudo_af_xtp : c_int = 19
let af_coip : c_int = 20
let af_cnt : c_int = 21
let pseudo_af_rtip : c_int = 22
let af_ipx : c_int = 23
let af_sip : c_int = 24
let pseudo_af_pip : c_int = 25
let af_isdn : c_int = 28
let af_e164 : c_int = af_isdn
let pseudo_af_key : c_int = 29
let af_inet6 : c_int = 30
let af_natm : c_int = 31
let af_system : c_int = 32
let af_netbios : c_int = 33
let af_ppp : c_int = 34
let pseudo_af_hdrcmplt : c_int = 35
let af_sys_control : c_int = 2
let sysproto_event : c_int = 1
let sysproto_control : c_int = 2
let pf_unspec : c_int = af_unspec
let pf_local : c_int = af_local
let pf_unix : c_int = pf_local
let pf_inet : c_int = af_inet
let pf_implink : c_int = af_implink
let pf_pup : c_int = af_pup
let pf_chaos : c_int = af_chaos
let pf_ns : c_int = af_ns
let pf_iso : c_int = af_iso
let pf_osi : c_int = af_iso
let pf_ecma : c_int = af_ecma
let pf_datakit : c_int = af_datakit
let pf_ccitt : c_int = af_ccitt
let pf_sna : c_int = af_sna
let pf_decnet : c_int = af_decnet
let pf_dli : c_int = af_dli
let pf_lat : c_int = af_lat
let pf_hylink : c_int = af_hylink
let pf_appletalk : c_int = af_appletalk
let pf_route : c_int = af_route
let pf_link : c_int = af_link
let pf_xtp : c_int = pseudo_af_xtp
let pf_coip : c_int = af_coip
let pf_cnt : c_int = af_cnt
let pf_sip : c_int = af_sip
let pf_ipx : c_int = af_ipx
let pf_rtip : c_int = pseudo_af_rtip
let pf_pip : c_int = pseudo_af_pip
let pf_isdn : c_int = af_isdn
let pf_key : c_int = pseudo_af_key
let pf_inet6 : c_int = af_inet6
let pf_natm : c_int = af_natm
let pf_system : c_int = af_system
let pf_netbios : c_int = af_netbios
let pf_ppp : c_int = af_ppp
let net_rt_dump : c_int = 1
let net_rt_flags : c_int = 2
let net_rt_iflist : c_int = 3
let somaxconn : c_int = 128
let sock_maxaddrlen : c_int = 255
let sock_stream : c_int = 1
let sock_dgram : c_int = 2
let sock_raw : c_int = 3
let sock_rdm : c_int = 4
let sock_seqpacket : c_int = 5
let ip_ttl : c_int = 4
let ip_hdrincl : c_int = 2
let ip_recvdstaddr : c_int = 7
let ip_add_membership : c_int = 12
let ip_drop_membership : c_int = 13
let ip_recvif : c_int = 20
let ip_pktinfo : c_int = 26
let ip_recvtos : c_int = 27
let ipv6_join_group : c_int = 12
let ipv6_leave_group : c_int = 13
let ipv6_recvtclass : c_int = 35
let ipv6_tclass : c_int = 36
let ipv6_pktinfo : c_int = 46
let ipv6_recvpktinfo : c_int = 61
let tcp_nopush : c_int = 4
let tcp_noopt : c_int = 8
let tcp_keepalive : c_int = 0x10

(** enable/disable tcp fastopen on this socket *)
let tcp_fastopen : c_int = 0x105

let sol_local : c_int = 0
let local_peercred : c_int = 0x001
let local_peerpid : c_int = 0x002
let local_peerepid : c_int = 0x003
let local_peeruuid : c_int = 0x004
let local_peereuuid : c_int = 0x005
let sol_socket : c_int = 0xffff
let so_debug : c_int = 0x01
let so_acceptconn : c_int = 0x0002
let so_reuseaddr : c_int = 0x0004
let so_keepalive : c_int = 0x0008
let so_dontroute : c_int = 0x0010
let so_broadcast : c_int = 0x0020
let so_useloopback : c_int = 0x0040
let so_linger : c_int = 0x0080
let so_oobinline : c_int = 0x0100
let so_reuseport : c_int = 0x0200
let so_timestamp : c_int = 0x0400
let so_timestamp_monotonic : c_int = 0x0800
let so_donttrunc : c_int = 0x2000
let so_wantmore : c_int = 0x4000
let so_wantoobflag : c_int = 0x8000
let so_sndbuf : c_int = 0x1001
let so_rcvbuf : c_int = 0x1002
let so_sndlowat : c_int = 0x1003
let so_rcvlowat : c_int = 0x1004
let so_sndtimeo : c_int = 0x1005
let so_rcvtimeo : c_int = 0x1006
let so_error : c_int = 0x1007
let so_type : c_int = 0x1008
let so_label : c_int = 0x1010
let so_peerlabel : c_int = 0x1011
let so_nread : c_int = 0x1020
let so_nke : c_int = 0x1021
let so_nosigpipe : c_int = 0x1022
let so_noaddrerr : c_int = 0x1023
let so_nwrite : c_int = 0x1024
let so_reuseshareuid : c_int = 0x1025
let so_notifyconflict : c_int = 0x1026
let so_randomport : c_int = 0x1082
let so_np_extensions : c_int = 0x1083
let msg_oob : c_int = 0x1
let msg_peek : c_int = 0x2
let msg_dontroute : c_int = 0x4
let msg_eor : c_int = 0x8
let msg_trunc : c_int = 0x10
let msg_ctrunc : c_int = 0x20
let msg_waitall : c_int = 0x40
let msg_dontwait : c_int = 0x80
let msg_eof : c_int = 0x100
let msg_flush : c_int = 0x400
let msg_hold : c_int = 0x800
let msg_send : c_int = 0x1000
let msg_havemore : c_int = 0x2000
let msg_rcvmore : c_int = 0x4000
(* // let msg_compat: c_int = 0x8000 *)

let scm_timestamp : c_int = 0x02
let scm_creds : c_int = 0x03

(* // https://github.com/aosm/xnu/blob/master/bsd/net/if.h#l140-l156 *)

(** interface is up *)
let iff_up : c_int = 0x1

(** broadcast address valid *)
let iff_broadcast : c_int = 0x2

(** turn on debugging *)
let iff_debug : c_int = 0x4

(** is a loopback net *)
let iff_loopback : c_int = 0x8

(** interface is point-to-point link *)
let iff_pointopoint : c_int = 0x10

(** obsolete: avoid use of trailers *)
let iff_notrailers : c_int = 0x20

(** resources allocated *)
let iff_running : c_int = 0x40

(** no address resolution protocol *)
let iff_noarp : c_int = 0x80

(** receive all packets *)
let iff_promisc : c_int = 0x100

(** receive all multicast packets *)
let iff_allmulti : c_int = 0x200

(** transmission in progress *)
let iff_oactive : c_int = 0x400

(** can't hear own transmissions *)
let iff_simplex : c_int = 0x800

(** per link layer defined bit *)
let iff_link0 : c_int = 0x1000

(** per link layer defined bit *)
let iff_link1 : c_int = 0x2000

(** per link layer defined bit *)
let iff_link2 : c_int = 0x4000

(** use alternate physical connection *)
let iff_altphys : c_int = iff_link2

(** supports multicast *)
let iff_multicast : c_int = 0x8000

let shut_rd : c_int = 0
let shut_wr : c_int = 1
let shut_rdwr : c_int = 2
let sae_associd_any : sae_associd_t = 0l

(** ((sae_associd_t)(-1ull)) *)
let sae_associd_all : sae_associd_t = 0xffffffffl

let sae_connid_any : sae_connid_t = 0l

(** ((sae_connid_t)(-1ull)) *)
let sae_connid_all : sae_connid_t = 0xffffffffl

(** connectx() flag parameters *)

(** resume connect() on read/write *)
let connect_resume_on_read_write : c_uint = 0x1

(** data is idempotent *)
let connect_data_idempotent : c_uint = 0x2

(** data includes security that replaces the tfo-cookie *)
let connect_data_authenticated : c_uint = 0x4

let lock_sh : c_int = 1
let lock_ex : c_int = 2
let lock_nb : c_int = 4
let lock_un : c_int = 8
let map_copy : c_int = 0x0002
let map_rename : c_int = 0x0020
let map_noreserve : c_int = 0x0040
let map_noextend : c_int = 0x0100
let map_hassemaphore : c_int = 0x0200
let map_nocache : c_int = 0x0400
let map_jit : c_int = 0x0800
let _sc_arg_max : c_int = 1
let _sc_child_max : c_int = 2
let _sc_clk_tck : c_int = 3
let _sc_ngroups_max : c_int = 4
let _sc_open_max : c_int = 5
let _sc_job_control : c_int = 6
let _sc_saved_ids : c_int = 7
let _sc_version : c_int = 8
let _sc_bc_base_max : c_int = 9
let _sc_bc_dim_max : c_int = 10
let _sc_bc_scale_max : c_int = 11
let _sc_bc_string_max : c_int = 12
let _sc_coll_weights_max : c_int = 13
let _sc_expr_nest_max : c_int = 14
let _sc_line_max : c_int = 15
let _sc_re_dup_max : c_int = 16
let _sc_2_version : c_int = 17
let _sc_2_c_bind : c_int = 18
let _sc_2_c_dev : c_int = 19
let _sc_2_char_term : c_int = 20
let _sc_2_fort_dev : c_int = 21
let _sc_2_fort_run : c_int = 22
let _sc_2_localedef : c_int = 23
let _sc_2_sw_dev : c_int = 24
let _sc_2_upe : c_int = 25
let _sc_stream_max : c_int = 26
let _sc_tzname_max : c_int = 27
let _sc_asynchronous_io : c_int = 28
let _sc_pagesize : c_int = 29
let _sc_memlock : c_int = 30
let _sc_memlock_range : c_int = 31
let _sc_memory_protection : c_int = 32
let _sc_message_passing : c_int = 33
let _sc_prioritized_io : c_int = 34
let _sc_priority_scheduling : c_int = 35
let _sc_realtime_signals : c_int = 36
let _sc_semaphores : c_int = 37
let _sc_fsync : c_int = 38
let _sc_shared_memory_objects : c_int = 39
let _sc_synchronized_io : c_int = 40
let _sc_timers : c_int = 41
let _sc_aio_listio_max : c_int = 42
let _sc_aio_max : c_int = 43
let _sc_aio_prio_delta_max : c_int = 44
let _sc_delaytimer_max : c_int = 45
let _sc_mq_open_max : c_int = 46
let _sc_mapped_files : c_int = 47
let _sc_rtsig_max : c_int = 48
let _sc_sem_nsems_max : c_int = 49
let _sc_sem_value_max : c_int = 50
let _sc_sigqueue_max : c_int = 51
let _sc_timer_max : c_int = 52
let _sc_nprocessors_conf : c_int = 57
let _sc_nprocessors_onln : c_int = 58
let _sc_2_pbs : c_int = 59
let _sc_2_pbs_accounting : c_int = 60
let _sc_2_pbs_checkpoint : c_int = 61
let _sc_2_pbs_locate : c_int = 62
let _sc_2_pbs_message : c_int = 63
let _sc_2_pbs_track : c_int = 64
let _sc_advisory_info : c_int = 65
let _sc_barriers : c_int = 66
let _sc_clock_selection : c_int = 67
let _sc_cputime : c_int = 68
let _sc_file_locking : c_int = 69
let _sc_host_name_max : c_int = 72
let _sc_monotonic_clock : c_int = 74
let _sc_reader_writer_locks : c_int = 76
let _sc_regexp : c_int = 77
let _sc_shell : c_int = 78
let _sc_spawn : c_int = 79
let _sc_spin_locks : c_int = 80
let _sc_sporadic_server : c_int = 81
let _sc_thread_cputime : c_int = 84
let _sc_thread_sporadic_server : c_int = 92
let _sc_timeouts : c_int = 95
let _sc_trace : c_int = 97
let _sc_trace_event_filter : c_int = 98
let _sc_trace_inherit : c_int = 99
let _sc_trace_log : c_int = 100
let _sc_typed_memory_objects : c_int = 102
let _sc_v6_ilp32_off32 : c_int = 103
let _sc_v6_ilp32_offbig : c_int = 104
let _sc_v6_lp64_off64 : c_int = 105
let _sc_v6_lpbig_offbig : c_int = 106
let _sc_ipv6 : c_int = 118
let _sc_raw_sockets : c_int = 119
let _sc_symloop_max : c_int = 120
let _sc_page_size : c_int = _sc_pagesize
let _sc_xopen_streams : c_int = 114
let _sc_xbs5_ilp32_off32 : c_int = 122
let _sc_xbs5_ilp32_offbig : c_int = 123
let _sc_xbs5_lp64_off64 : c_int = 124
let _sc_xbs5_lpbig_offbig : c_int = 125
let _sc_ss_repl_max : c_int = 126
let _sc_trace_event_name_max : c_int = 127
let _sc_trace_name_max : c_int = 128
let _sc_trace_sys_max : c_int = 129
let _sc_trace_user_event_max : c_int = 130
let _sc_pass_max : c_int = 131
let minsigstksz : size_t = 32768
let sigstksz : size_t = 131072
let fd_setsize : usize = 1024
let st_nosuid : c_ulong = 2
let evfilt_read : i16 = -1
let evfilt_write : i16 = -2
let evfilt_aio : i16 = -3
let evfilt_vnode : i16 = -4
let evfilt_proc : i16 = -5
let evfilt_signal : i16 = -6
let evfilt_timer : i16 = -7
let evfilt_machport : i16 = -8
let evfilt_fs : i16 = -9
let evfilt_user : i16 = -10
let evfilt_vm : i16 = -12
let ev_add : u16 = 0x1
let ev_delete : u16 = 0x2
let ev_enable : u16 = 0x4
let ev_disable : u16 = 0x8
let ev_oneshot : u16 = 0x10
let ev_clear : u16 = 0x20
let ev_receipt : u16 = 0x40
let ev_dispatch : u16 = 0x80
let ev_flag0 : u16 = 0x1000
let ev_poll : u16 = 0x1000
let ev_flag1 : u16 = 0x2000
let ev_ooband : u16 = 0x2000
let ev_error : u16 = 0x4000
let ev_eof : u16 = 0x8000
let ev_sysflags : u16 = 0xf000
let note_trigger : u32 = 0x01000000l
let note_ffnop : u32 = 0x00000000l
let note_ffand : u32 = 0x40000000l
let note_ffor : u32 = 0x80000000l
let note_ffcopy : u32 = 0xc0000000l
let note_ffctrlmask : u32 = 0xc0000000l
let note_fflagsmask : u32 = 0x00ffffffl
let note_lowat : u32 = 0x00000001l
let note_delete : u32 = 0x00000001l
let note_write : u32 = 0x00000002l
let note_extend : u32 = 0x00000004l
let note_attrib : u32 = 0x00000008l
let note_link : u32 = 0x00000010l
let note_rename : u32 = 0x00000020l
let note_revoke : u32 = 0x00000040l
let note_none : u32 = 0x00000080l
let note_exit : u32 = 0x80000000l
let note_fork : u32 = 0x40000000l
let note_exec : u32 = 0x20000000l [@@deprecated "deprecated since macosx 10.9"]
let note_reap : u32 = 0x10000000l
let note_signal : u32 = 0x08000000l
let note_exitstatus : u32 = 0x04000000l
let note_exit_detail : u32 = 0x02000000l
let note_pdatamask : u32 = 0x000fffffl

let note_pctrlmask : u32 = 0xfff00000l
[@@deprecated "deprecated since macosx 10.9"]

let note_exit_reparented : u32 = 0x00080000l
let note_exit_detail_mask : u32 = 0x00070000l
let note_exit_decryptfail : u32 = 0x00010000l
let note_exit_memory : u32 = 0x00020000l
let note_exit_cserror : u32 = 0x00040000l
let note_vm_pressure : u32 = 0x80000000l
let note_vm_pressure_terminate : u32 = 0x40000000l
let note_vm_pressure_sudden_terminate : u32 = 0x20000000l
let note_vm_error : u32 = 0x10000000l
let note_seconds : u32 = 0x00000001l
let note_useconds : u32 = 0x00000002l
let note_nseconds : u32 = 0x00000004l
let note_absolute : u32 = 0x00000008l
let note_leeway : u32 = 0x00000010l
let note_critical : u32 = 0x00000020l
let note_background : u32 = 0x00000040l
let note_track : u32 = 0x00000001l
let note_trackerr : u32 = 0x00000002l
let note_child : u32 = 0x00000004l
let ocrnl : tcflag_t = 0x00000010
let onocr : tcflag_t = 0x00000020
let onlret : tcflag_t = 0x00000040
let ofill : tcflag_t = 0x00000080
let nldly : tcflag_t = 0x00000300
let tabdly : tcflag_t = 0x00000c04
let crdly : tcflag_t = 0x00003000
let ffdly : tcflag_t = 0x00004000
let bsdly : tcflag_t = 0x00008000
let vtdly : tcflag_t = 0x00010000
let ofdel : tcflag_t = 0x00020000
let nl0 : tcflag_t = 0x00000000
let nl1 : tcflag_t = 0x00000100
let tab0 : tcflag_t = 0x00000000
let tab1 : tcflag_t = 0x00000400
let tab2 : tcflag_t = 0x00000800
let cr0 : tcflag_t = 0x00000000
let cr1 : tcflag_t = 0x00001000
let cr2 : tcflag_t = 0x00002000
let cr3 : tcflag_t = 0x00003000
let ff0 : tcflag_t = 0x00000000
let ff1 : tcflag_t = 0x00004000
let bs0 : tcflag_t = 0x00000000
let bs1 : tcflag_t = 0x00008000
let tab3 : tcflag_t = 0x00000004
let vt0 : tcflag_t = 0x00000000
let vt1 : tcflag_t = 0x00010000
let iutf8 : tcflag_t = 0x00004000
let crtscts : tcflag_t = 0x00030000
let ni_maxhost : socklen_t = 1025
let ni_maxserv : socklen_t = 32
let ni_nofqdn : c_int = 0x00000001
let ni_numerichost : c_int = 0x00000002
let ni_namereqd : c_int = 0x00000004
let ni_numericserv : c_int = 0x00000008
let ni_numericscope : c_int = 0x00000100
let ni_dgram : c_int = 0x00000010
let q_getquota : c_int = 0x300
let q_setquota : c_int = 0x400
let rename_swap : c_uint = 0x00000002
let rename_excl : c_uint = 0x00000004
let rtld_local : c_int = 0x4
let rtld_first : c_int = 0x100
let rtld_nodelete : c_int = 0x80
let rtld_noload : c_int = 0x10
let rtld_global : c_int = 0x8
let _wstopped : c_int = 0o177
let log_netinfo : c_int = 12 lsl 3
let log_remoteauth : c_int = 13 lsl 3
let log_install : c_int = 14 lsl 3
let log_ras : c_int = 15 lsl 3
let log_launchd : c_int = 24 lsl 3
let log_nfacilities : c_int = 25
let ctltype : c_int = 0xf
let ctltype_node : c_int = 1
let ctltype_int : c_int = 2
let ctltype_string : c_int = 3
let ctltype_quad : c_int = 4
let ctltype_opaque : c_int = 5
let ctltype_struct : c_int = ctltype_opaque
let ctlflag_rd : c_int = 0x80000000
let ctlflag_wr : c_int = 0x40000000
let ctlflag_rw : c_int = ctlflag_rd lor ctlflag_wr
let ctlflag_nolock : c_int = 0x20000000
let ctlflag_anybody : c_int = 0x10000000
let ctlflag_secure : c_int = 0x08000000
let ctlflag_masked : c_int = 0x04000000
let ctlflag_noauto : c_int = 0x02000000
let ctlflag_kern : c_int = 0x01000000
let ctlflag_locked : c_int = 0x00800000
let ctlflag_oid2 : c_int = 0x00400000
let ctl_unspec : c_int = 0
let ctl_kern : c_int = 1
let ctl_vm : c_int = 2
let ctl_vfs : c_int = 3
let ctl_net : c_int = 4
let ctl_debug : c_int = 5
let ctl_hw : c_int = 6
let ctl_machdep : c_int = 7
let ctl_user : c_int = 8
let ctl_maxid : c_int = 9
let kern_ostype : c_int = 1
let kern_osrelease : c_int = 2
let kern_osrev : c_int = 3
let kern_version : c_int = 4
let kern_maxvnodes : c_int = 5
let kern_maxproc : c_int = 6
let kern_maxfiles : c_int = 7
let kern_argmax : c_int = 8
let kern_securelvl : c_int = 9
let kern_hostname : c_int = 10
let kern_hostid : c_int = 11
let kern_clockrate : c_int = 12
let kern_vnode : c_int = 13
let kern_proc : c_int = 14
let kern_file : c_int = 15
let kern_prof : c_int = 16
let kern_posix1 : c_int = 17
let kern_ngroups : c_int = 18
let kern_job_control : c_int = 19
let kern_saved_ids : c_int = 20
let kern_boottime : c_int = 21
let kern_nisdomainname : c_int = 22
let kern_domainname : c_int = kern_nisdomainname
let kern_maxpartitions : c_int = 23
let kern_kdebug : c_int = 24
let kern_updateinterval : c_int = 25
let kern_osreldate : c_int = 26
let kern_ntp_pll : c_int = 27
let kern_bootfile : c_int = 28
let kern_maxfilesperproc : c_int = 29
let kern_maxprocperuid : c_int = 30
let kern_dumpdev : c_int = 31
let kern_ipc : c_int = 32
let kern_dummy : c_int = 33
let kern_ps_strings : c_int = 34
let kern_usrstack32 : c_int = 35
let kern_logsigexit : c_int = 36
let kern_symfile : c_int = 37
let kern_procargs : c_int = 38
let kern_netboot : c_int = 40
let kern_sysv : c_int = 42
let kern_affinity : c_int = 43
let kern_translate : c_int = 44
let kern_classic : c_int = kern_translate
let kern_exec : c_int = 45
let kern_classichandler : c_int = kern_exec
let kern_aiomax : c_int = 46
let kern_aioprocmax : c_int = 47
let kern_aiothreads : c_int = 48
let kern_corefile : c_int = 50
let kern_coredump : c_int = 51
let kern_sugid_coredump : c_int = 52
let kern_procdelayterm : c_int = 53
let kern_shreg_privatizable : c_int = 54
let kern_low_pri_window : c_int = 56
let kern_low_pri_delay : c_int = 57
let kern_posix : c_int = 58
let kern_usrstack64 : c_int = 59
let kern_nx_protection : c_int = 60
let kern_tfp : c_int = 61
let kern_procname : c_int = 62
let kern_thaltstack : c_int = 63
let kern_speculative_reads : c_int = 64
let kern_osversion : c_int = 65
let kern_safeboot : c_int = 66
let kern_ragevnode : c_int = 68
let kern_tty : c_int = 69
let kern_checkopenevt : c_int = 70
let kern_threadname : c_int = 71
let kern_maxid : c_int = 72
let kern_rage_proc : c_int = 1
let kern_rage_thread : c_int = 2
let kern_unrage_proc : c_int = 3
let kern_unrage_thread : c_int = 4
let kern_openevt_proc : c_int = 1
let kern_unopenevt_proc : c_int = 2
let kern_tfp_policy : c_int = 1
let kern_tfp_policy_deny : c_int = 0
let kern_tfp_policy_default : c_int = 2
let kern_kdeflags : c_int = 1
let kern_kddflags : c_int = 2
let kern_kdenable : c_int = 3
let kern_kdsetbuf : c_int = 4
let kern_kdgetbuf : c_int = 5
let kern_kdsetup : c_int = 6
let kern_kdremove : c_int = 7
let kern_kdsetreg : c_int = 8
let kern_kdgetreg : c_int = 9
let kern_kdreadtr : c_int = 10
let kern_kdpidtr : c_int = 11
let kern_kdthrmap : c_int = 12
let kern_kdpidex : c_int = 14
let kern_kdsetrtcdec : c_int = 15
let kern_kdgetentropy : c_int = 16
let kern_kdwritetr : c_int = 17
let kern_kdwritemap : c_int = 18

let kern_kdenable_bg_trace : c_int =
  (19 [@deprecated "deprecated since macosx 10.12"])

let kern_kddisable_bg_trace : c_int =
  (20 [@deprecated "deprecated since macosx 10.12"])

let kern_kdreadcurthrmap : c_int = 21
let kern_kdset_typefilter : c_int = 22
let kern_kdbufwait : c_int = 23
let kern_kdcpumap : c_int = 24
let kern_proc_all : c_int = 0
let kern_proc_pid : c_int = 1
let kern_proc_pgrp : c_int = 2
let kern_proc_session : c_int = 3
let kern_proc_tty : c_int = 4
let kern_proc_uid : c_int = 5
let kern_proc_ruid : c_int = 6
let kern_proc_lcid : c_int = 7
let kipc_maxsockbuf : c_int = 1
let kipc_sockbuf_waste : c_int = 2
let kipc_somaxconn : c_int = 3
let kipc_max_linkhdr : c_int = 4
let kipc_max_protohdr : c_int = 5
let kipc_max_hdr : c_int = 6
let kipc_max_datalen : c_int = 7
let kipc_mbstat : c_int = 8
let kipc_nmbclusters : c_int = 9
let kipc_soqlimitcompat : c_int = 10
let vm_meter : c_int = 1
let vm_loadavg : c_int = 2
let vm_machfactor : c_int = 4
let vm_swapusage : c_int = 5
let vm_maxid : c_int = 6
let hw_machine : c_int = 1
let hw_model : c_int = 2
let hw_ncpu : c_int = 3
let hw_byteorder : c_int = 4
let hw_physmem : c_int = 5
let hw_usermem : c_int = 6
let hw_pagesize : c_int = 7
let hw_disknames : c_int = 8
let hw_diskstats : c_int = 9
let hw_epoch : c_int = 10
let hw_floatingpt : c_int = 11
let hw_machine_arch : c_int = 12
let hw_vectorunit : c_int = 13
let hw_bus_freq : c_int = 14
let hw_cpu_freq : c_int = 15
let hw_cacheline : c_int = 16
let hw_l1icachesize : c_int = 17
let hw_l1dcachesize : c_int = 18
let hw_l2settings : c_int = 19
let hw_l2cachesize : c_int = 20
let hw_l3settings : c_int = 21
let hw_l3cachesize : c_int = 22
let hw_tb_freq : c_int = 23
let hw_memsize : c_int = 24
let hw_availcpu : c_int = 25
let hw_maxid : c_int = 26
let user_cs_path : c_int = 1
let user_bc_base_max : c_int = 2
let user_bc_dim_max : c_int = 3
let user_bc_scale_max : c_int = 4
let user_bc_string_max : c_int = 5
let user_coll_weights_max : c_int = 6
let user_expr_nest_max : c_int = 7
let user_line_max : c_int = 8
let user_re_dup_max : c_int = 9
let user_posix2_version : c_int = 10
let user_posix2_c_bind : c_int = 11
let user_posix2_c_dev : c_int = 12
let user_posix2_char_term : c_int = 13
let user_posix2_fort_dev : c_int = 14
let user_posix2_fort_run : c_int = 15
let user_posix2_localedef : c_int = 16
let user_posix2_sw_dev : c_int = 17
let user_posix2_upe : c_int = 18
let user_stream_max : c_int = 19
let user_tzname_max : c_int = 20
let user_maxid : c_int = 21
let ctl_debug_name : c_int = 0
let ctl_debug_value : c_int = 1
let ctl_debug_maxid : c_int = 20
let prio_darwin_thread : c_int = 3
let prio_darwin_process : c_int = 4
let prio_darwin_bg : c_int = 0x1000
let prio_darwin_nonui : c_int = 0x1001

(* let sem_failed: *mut sem_t = -1isize as *mut :sem_t *)

let ai_passive : c_int = 0x00000001
let ai_canonname : c_int = 0x00000002
let ai_numerichost : c_int = 0x00000004
let ai_numericserv : c_int = 0x00001000
let ai_all : c_int = 0x00000100
let ai_v4mapped_cfg : c_int = 0x00000200
let ai_addrconfig : c_int = 0x00000400
let ai_v4mapped : c_int = 0x00000800
let ai_default : c_int = ai_v4mapped_cfg lor ai_addrconfig
let ai_unusable : c_int = 0x10000000

let ai_mask : c_int =
  ai_passive lor ai_canonname lor ai_numerichost lor ai_numericserv
  lor ai_addrconfig

let sigev_none : c_int = 0
let sigev_signal : c_int = 1
let sigev_thread : c_int = 3
let aio_canceled : c_int = 2
let aio_notcanceled : c_int = 4
let aio_alldone : c_int = 1

let aio_listio_max : c_int =
  (16 [@deprecated "can vary at runtime.  use sysconf(3) instead"])

let lio_nop : c_int = 0
let lio_write : c_int = 2
let lio_read : c_int = 1
let lio_wait : c_int = 2
let lio_nowait : c_int = 1
let wexited : c_int = 0x00000004
let wstopped : c_int = 0x00000008
let wcontinued : c_int = 0x00000010
let wnowait : c_int = 0x00000020
let p_all : idtype_t = 0
let p_pid : idtype_t = 1
let p_pgid : idtype_t = 2
let utime_omit : c_long = -2
let utime_now : c_long = -1
let xattr_nofollow : c_int = 0x0001
let xattr_create : c_int = 0x0002
let xattr_replace : c_int = 0x0004
let xattr_nosecurity : c_int = 0x0008
let xattr_nodefault : c_int = 0x0010
let xattr_showcompression : c_int = 0x0020
let net_rt_iflist2 : c_int = 0x0006

(* // net/route.h *)
let rtf_up : c_int = 0x1
let rtf_gateway : c_int = 0x2
let rtf_host : c_int = 0x4
let rtf_reject : c_int = 0x8
let rtf_dynamic : c_int = 0x10
let rtf_modified : c_int = 0x20
let rtf_done : c_int = 0x40
let rtf_delclone : c_int = 0x80
let rtf_cloning : c_int = 0x100
let rtf_xresolve : c_int = 0x200
let rtf_llinfo : c_int = 0x400
let rtf_static : c_int = 0x800
let rtf_blackhole : c_int = 0x1000
let rtf_noifref : c_int = 0x2000
let rtf_proto2 : c_int = 0x4000
let rtf_proto1 : c_int = 0x8000
let rtf_prcloning : c_int = 0x10000
let rtf_wascloned : c_int = 0x20000
let rtf_proto3 : c_int = 0x40000
let rtf_pinned : c_int = 0x100000
let rtf_local : c_int = 0x200000
let rtf_broadcast : c_int = 0x400000
let rtf_multicast : c_int = 0x800000
let rtf_ifscope : c_int = 0x1000000
let rtf_condemned : c_int = 0x2000000
let rtf_ifref : c_int = 0x4000000
let rtf_proxy : c_int = 0x8000000
let rtf_router : c_int = 0x10000000
let rtm_version : c_int = 5

(* // message types *)
let rtm_add : c_int = 0x1
let rtm_delete : c_int = 0x2
let rtm_change : c_int = 0x3
let rtm_get : c_int = 0x4
let rtm_losing : c_int = 0x5
let rtm_redirect : c_int = 0x6
let rtm_miss : c_int = 0x7
let rtm_lock : c_int = 0x8
let rtm_oldadd : c_int = 0x9
let rtm_olddel : c_int = 0xa
let rtm_resolve : c_int = 0xb
let rtm_newaddr : c_int = 0xc
let rtm_deladdr : c_int = 0xd
let rtm_ifinfo : c_int = 0xe
let rtm_newmaddr : c_int = 0xf
let rtm_delmaddr : c_int = 0x10
let rtm_ifinfo2 : c_int = 0x12
let rtm_newmaddr2 : c_int = 0x13
let rtm_get2 : c_int = 0x14

(* // bitmask values for rtm_inits and rmx_locks. *)
let rtv_mtu : c_int = 0x1
let rtv_hopcount : c_int = 0x2
let rtv_expire : c_int = 0x4
let rtv_rpipe : c_int = 0x8
let rtv_spipe : c_int = 0x10
let rtv_ssthresh : c_int = 0x20
let rtv_rtt : c_int = 0x40
let rtv_rttvar : c_int = 0x80

(* // bitmask values for rtm_addrs. *)
let rta_dst : c_int = 0x1
let rta_gateway : c_int = 0x2
let rta_netmask : c_int = 0x4
let rta_genmask : c_int = 0x8
let rta_ifp : c_int = 0x10
let rta_ifa : c_int = 0x20
let rta_author : c_int = 0x40
let rta_brd : c_int = 0x80

(* // index offsets for sockaddr array for alternate internal encoding. *)
let rtax_dst : c_int = 0
let rtax_gateway : c_int = 1
let rtax_netmask : c_int = 2
let rtax_genmask : c_int = 3
let rtax_ifp : c_int = 4
let rtax_ifa : c_int = 5
let rtax_author : c_int = 6
let rtax_brd : c_int = 7
let rtax_max : c_int = 8
let kern_procargs2 : c_int = 49
let proc_pidtaskallinfo : c_int = 2
let proc_pidtaskinfo : c_int = 4
let proc_pidthreadinfo : c_int = 5
let maxcomlen : usize = 16
let maxthreadnamesize : usize = 64
let xucred_version : c_uint = 0
let lc_segment : u32 = 0x1l
let lc_segment_64 : u32 = 0x19l
let mh_magic : u32 = 0xfeedfacel
let mh_magic_64 : u32 = 0xfeedfacfl

(* // net/if_utun.h *)
let utun_opt_flags : c_int = 1
let utun_opt_ifname : c_int = 2

(* // net/bpf.h *)

(** no link-layer encapsulation *)
let dlt_null : c_uint = 0

(** ethernet (10mb) *)
let dlt_en10mb : c_uint = 1

(** experimental ethernet (3mb) *)
let dlt_en3mb : c_uint = 2

(** amateur radio ax.25 *)
let dlt_ax25 : c_uint = 3

(** proteon pronet token ring *)
let dlt_pronet : c_uint = 4

(** chaos *)
let dlt_chaos : c_uint = 5

(** ieee 802 networks *)
let dlt_ieee802 : c_uint = 6

(** arcnet *)
let dlt_arcnet : c_uint = 7

(** serial line ip *)
let dlt_slip : c_uint = 8

(** point-to-point protocol *)
let dlt_ppp : c_uint = 9

(** fddi *)
let dlt_fddi : c_uint = 10

(** llc/snap encapsulated atm *)
let dlt_atm_rfc1483 : c_uint = 11

(** raw ip *)
let dlt_raw : c_uint = 12

let dlt_loop : c_uint = 108

(* // https://github.com/apple/darwin-xnu/blob/master/bsd/net/bpf.h#l100 *)
(* // sizeof(i32) *)
let bpf_alignment : c_int = 4

(* // sys/mount.h *)
let mnt_rdonly : c_int = 0x00000001
let mnt_synchronous : c_int = 0x00000002
let mnt_noexec : c_int = 0x00000004
let mnt_nosuid : c_int = 0x00000008
let mnt_nodev : c_int = 0x00000010
let mnt_union : c_int = 0x00000020
let mnt_async : c_int = 0x00000040
let mnt_cprotect : c_int = 0x00000080

(* // nfs export related mount flags. *)
let mnt_exported : c_int = 0x00000100

(* // mac labeled / "quarantined" flag *)
let mnt_quarantine : c_int = 0x00000400

(* // flags set by internal operations. *)
let mnt_local : c_int = 0x00001000
let mnt_quota : c_int = 0x00002000
let mnt_rootfs : c_int = 0x00004000
let mnt_dovolfs : c_int = 0x00008000
let mnt_dontbrowse : c_int = 0x00100000
let mnt_ignore_ownership : c_int = 0x00200000
let mnt_automounted : c_int = 0x00400000
let mnt_journaled : c_int = 0x00800000
let mnt_nouserxattr : c_int = 0x01000000
let mnt_defwrite : c_int = 0x02000000
let mnt_multilabel : c_int = 0x04000000
let mnt_noatime : c_int = 0x10000000
let mnt_snapshot : c_int = 0x40000000

(* // external filesystem command modifier flags. *)
let mnt_update : c_int = 0x00010000
let mnt_noblock : c_int = 0x00020000
let mnt_reload : c_int = 0x00040000

(* // sys/spawn.h: *)
let posix_spawn_resetids : c_int = 0x01
let posix_spawn_setpgroup : c_int = 0x02
let posix_spawn_setsigdef : c_int = 0x04
let posix_spawn_setsigmask : c_int = 0x08
let posix_spawn_setexec : c_int = 0x40
let posix_spawn_start_suspended : c_int = 0x80
let posix_spawn_cloexec_default : c_int = 0x4000

(* // sys/ipc.h: *)
let ipc_creat : c_int = 0x200
let ipc_excl : c_int = 0x400
let ipc_nowait : c_int = 0x800
let ipc_private : key_t = 0
let ipc_rmid : c_int = 0
let ipc_set : c_int = 1
let ipc_stat : c_int = 2
let ipc_r : c_int = 0x100
let ipc_w : c_int = 0x80
let ipc_m : c_int = 0x1000

(* // sys/sem.h *)
let sem_undo : c_int = 0o10000
let getncnt : c_int = 3
let getpid : c_int = 4
let getval : c_int = 5
let getall : c_int = 6
let getzcnt : c_int = 7
let setval : c_int = 8
let setall : c_int = 9

(* // sys/shm.h *)
let shm_rdonly : c_int = 0x1000
let shm_rnd : c_int = 0x2000
let shmlba : c_int = 4096
let shm_r : c_int = ipc_r
let shm_w : c_int = ipc_w

(* // flags for chflags(2) *)
let uf_settable : c_uint = 0x0000ffff
let uf_nodump : c_uint = 0x00000001
let uf_immutable : c_uint = 0x00000002
let uf_append : c_uint = 0x00000004
let uf_opaque : c_uint = 0x00000008
let uf_compressed : c_uint = 0x00000020
let uf_tracked : c_uint = 0x00000040
let sf_settable : c_uint = 0xffff0000
let sf_archived : c_uint = 0x00010000
let sf_immutable : c_uint = 0x00020000
let sf_append : c_uint = 0x00040000
let uf_hidden : c_uint = 0x00008000

(* //<sys/timex.h> *)
let ntp_api : c_int = 4
let maxphase : c_long = 500000000
let maxfreq : c_long = 500000
let minsec : c_int = 256
let maxsec : c_int = 2048
let nanosecond : c_long = 1000000000
let scale_ppm : c_int = 65
let maxtc : c_int = 10
let mod_offset : c_uint = 0x0001
let mod_frequency : c_uint = 0x0002
let mod_maxerror : c_uint = 0x0004
let mod_esterror : c_uint = 0x0008
let mod_status : c_uint = 0x0010
let mod_timeconst : c_uint = 0x0020
let mod_ppsmax : c_uint = 0x0040
let mod_tai : c_uint = 0x0080
let mod_micro : c_uint = 0x1000
let mod_nano : c_uint = 0x2000
let mod_clkb : c_uint = 0x4000
let mod_clka : c_uint = 0x8000
let sta_pll : c_int = 0x0001
let sta_ppsfreq : c_int = 0x0002
let sta_ppstime : c_int = 0x0004
let sta_fll : c_int = 0x0008
let sta_ins : c_int = 0x0010
let sta_del : c_int = 0x0020
let sta_unsync : c_int = 0x0040
let sta_freqhold : c_int = 0x0080
let sta_ppssignal : c_int = 0x0100
let sta_ppsjitter : c_int = 0x0200
let sta_ppswander : c_int = 0x0400
let sta_ppserror : c_int = 0x0800
let sta_clockerr : c_int = 0x1000
let sta_nano : c_int = 0x2000
let sta_mode : c_int = 0x4000
let sta_clk : c_int = 0x8000

let sta_ronly : c_int =
  sta_ppssignal lor sta_ppsjitter lor sta_ppswander lor sta_ppserror
  lor sta_clockerr lor sta_nano lor sta_mode lor sta_clk

let time_ok : c_int = 0
let time_ins : c_int = 1
let time_del : c_int = 2
let time_oop : c_int = 3
let time_wait : c_int = 4
let time_error : c_int = 5
