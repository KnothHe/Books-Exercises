#lang sicp

; jz's answer on the scheme wiki is clear enough
; So I just copy his answer to here, and modify a litter

; percent-interval :=> PI  old-interval :=> OI

; PI(a, pa) -> OI(a-a*pa, a+a*pa)
; PI(b, pb) -> OI(b-b*pb, b+b*pb)

; PI(c, p) = PI(a, pa)*PI(b, pb)
; :=> OI(a-a*pa, a+a*pa) * OI(b-b*pb, b+b*pb)
; = OI((a-a*pa)*(b-b*pb), (a+a*pa)*(b+b*pb))
; = OI(cL, cU)

; c = (cL + cU)/2
; = ((a-a*pa)*(b-b*pb) + (a+a*pa)*(b+b*pb))/2
; = a*b*(1+pa*pb)

; p = (c-cL)/c
; = (a*b*(1+pa*pb) - (a-a*pa)*(b-b*pb))/a*b*(1+pa*pb)
; = a*b*(pa + pb)/a*b*(1+pa*pb)
; = (pa+pb)/(1+pa*pb)

; c = a*b*(1+pa*pb);
; p = (pa+pb)/(1+pa*pb);

; since the values of pa and pb are relatively small,
; the pa*pb value can be ignored.
; so:
; p = pa + pb, when pa and pb is relatively small
