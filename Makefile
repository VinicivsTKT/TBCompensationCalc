XSLTPROC = xsltproc

xslt_in = compcalc.xslt
outdir = .
base_html = index
valuesdir = res/values

strings = $(wildcard $(valuesdir)*/strings.xml)

.PHONY: all clean

all: $(patsubst $(valuesdir)%,$(outdir)/$(base_html)%,$(strings:/strings.xml=.html))

clean:
	-rm $(outdir)/$(base_html)*.html

$(outdir)/$(base_html).html: $(xslt_in) $(valuesdir)/strings.xml
	$(XSLTPROC) -o $@ --stringparam lang en $^

$(outdir)/$(base_html)-%.html: $(xslt_in) $(valuesdir)-%/strings.xml
	$(XSLTPROC) -o $@ --stringparam lang $(@:$(outdir)/$(base_html)-%.html=%) $^
