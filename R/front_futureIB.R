front_future.IB <- function (root, currency='USD', underlying_id = NULL, addIBslot=TRUE) 
{
    contract <- twsContract()
    contract$symbol <- root
    contract$currency <- currency
    contract$sectype <- "FUT"
    instr <- Instr_From_Contr(contract,addIBslot=addIBslot,updateInstrument=TRUE,
                    output='instrument',assign_i=FALSE,assign_c=TRUE)

    if (is.null(instr$underlying_id) && is.null(underlying_id)) {
        warning("underlying_id should only be NULL for cash-settled futures")
    } else if (is.null(instr$underlying_id)) {
        instr$underlying_id <- underlying_id
    } else if (!is.null(underlying_id) && !exists(underlying_id, where = .instrument, inherits = TRUE)) {
        warning('underlying_id not defined.')    
    }
    #Do we need to create the root?
    tmproot <- try(get(instr$primary_id,pos=.instrument),silent=TRUE)
    if (!inherits(tmproot,'future')) {
        if (is.instrument(tmproot)) {
            warning(paste(instr$primary_id,
                    " already exists, but it is not futures specs.", sep=""))
                    #"Specs will be stored in ", instr$primary_id, "_fspecs", 
                    #sep="")
            store.to <- paste(instr$primary_id, 'fspecs', sep="_")
        } else store.to <- instr$primary_id

        future(primary_id=store.to, currency=instr$currency,
                multiplier=instr$multiplier, tick_size=as.numeric(instr$tick_size),
                identifiers=instr$identifiers, 
                underlying_id=instr$underlying_id)           
        cat(paste('Futures contract specs stored in ', store.to, "\n", sep=""))    
    }

    instr$suffix_id <- gsub(instr$primary_id, "", instr$local)    
    id <- paste(instr$primary_id, instr$suffix_id, sep="_")   
    id <- gsub(" ","", id) 
    instr$primary_id <- id
    class(instr) <- c('future_series','future','instrument')
    assign(id, instr, pos=.instrument)   
    id
}
