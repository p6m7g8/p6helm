######################################################################
#<
#
# Function: p6df::modules::p6helm::version()
#
#>
######################################################################
p6df::modules::p6helm::version() { echo "0.0.1"; }

######################################################################
#<
#
# Function: p6df::modules::p6helm::deps()
#
#>
######################################################################
p6df::modules::p6helm::deps() { ModuleDeps=() }

######################################################################
#<
#
# Function: p6df::modules::p6helm::init()
#
#>
######################################################################
p6df::modules::p6helm::init() { }

p6_helm_prompt_info() {

    local str
    
    if ! p6_string_blank "$KUBECONFIG"; then
      str="helm:     "
    fi

    local helm_ctx=${HELM_KUBECONTEXT:-$P6_KUBE_CFG}
    if ! p6_string_blank "$helm_ctx"; then
      str="${str}ctx=[$helm_ctx]"
    fi
    local helm_ns=${HELM_NAMESPACE:-$P6_KUBE_NS} 
    if ! p6_string_blank "$helm_ns"; then
      str="${str} ns=[$helm_ns]"
    fi

    if p6_string_blank "$str"; then
      p6_return_void
    else
      p6_return_str "$str"
    fi
}