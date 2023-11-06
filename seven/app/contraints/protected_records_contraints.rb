class ProtectedRecordsContraints
    def matches?(req)
        req.params[:id].to_i < 100
    end
end