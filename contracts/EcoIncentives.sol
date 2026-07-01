// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

/**
 * @title EcoIncentives
 * @dev Protocolo de asignación automatizada de EcoPoints en LNet (LACNet)
 * Diseñado para mitigar costos de transacción y fallas de mercado en la economía circular.
 */
contract EcoIncentives {
    
    // Variables de estado del incentivo económico (Inmutables tras el despliegue)
    string public name = "EcoIncentives Points";
    string public symbol = "ECO";
    uint8 public decimals = 0; // Puntos enteros no fraccionables para evitar fricción de cálculo
    
    // Dirección de la entidad reguladora (ej. Municipalidad de Lima)
    address public owner;
    
    // Métrica macro global de impacto ambiental (Métrica clave para el Pitch Deck)
    uint256 public totalGlobalRecycledKg;
    
    // Estructuras de datos optimizadas con acceso O(1) en gas
    mapping(address => uint256) private _balances;
    mapping(address => uint256) private _totalRecycledKg;

    // Eventos on-chain indexados para auditoría pública transparente (Cierra asimetría de información)
    event RecyclingRegistered(address indexed citizen, uint256 weightInKg, uint256 pointsMinted);
    event RewardRedeemed(address indexed citizen, uint256 pointsBurned, string rewardDescription);
    event OwnershipTransferred(address indexed previousOwner, address indexed newOwner);

    // Modificador de seguridad que previene exploits en la acuñación de puntos
    modifier onlyOwner() {
        require(msg.sender == owner, "EcoIncentives: Solo la entidad autorizada puede ejecutar esta accion");
        _;
    }

    constructor() {
        owner = msg.sender; // El monedero que despliega el contrato se define como la Municipalidad
    }

    /**
     * @notice Registra una acción de reciclaje verificada y emite EcoPoints automáticamente.
     * @dev Cumple con la regla de diseño de mecanismos: 10 ECO por cada 1 Kg verificado.
     * @param citizen Dirección de la billetera virtual del ciudadano.
     * @param weightInKg Kilos de material reciclado registrados en el centro de acopio.
     */
    function registerRecycling(address citizen, uint256 weightInKg) external onlyOwner {
        require(citizen != address(0), "EcoIncentives: Direccion de ciudadano invalida");
        require(weightInKg > 0, "EcoIncentives: El peso debe ser mayor a cero");

        uint256 pointsToMint = weightInKg * 10;

        // Modificaciones de estado eficientes (Mitigan la tarifa de gas por bloque)
        _balances[citizen] += pointsToMint;
        _totalRecycledKg[citizen] += weightInKg;
        totalGlobalRecycledKg += weightInKg;

        emit RecyclingRegistered(citizen, weightInKg, pointsToMint);
    }

    /**
     * @notice Permite a la gobernanza transferir el rol de administrador (Owner).
     * @param newOwner Dirección de la nueva cuenta municipal autorizada.
     */
    function transferOwnership(address newOwner) external onlyOwner {
        require(newOwner != address(0), "EcoIncentives: Nueva direccion invalida");
        emit OwnershipTransferred(owner, newOwner);
        owner = newOwner;
    }

    /**
     * @notice Permite a los ciudadanos redimir sus puntos por beneficios del mercado secundario.
     * @param pointsToRedeem Cantidad de puntos a descontar para aplicar el beneficio.
     * @param rewardDescription Detalle comercial del premio (ej. "15% descuento en Supermercado").
     */
    function redeemReward(uint256 pointsToRedeem, string memory rewardDescription) external {
        require(_balances[msg.sender] >= pointsToRedeem, "EcoIncentives: Balance de EcoPoints insuficiente");
        
        _balances[msg.sender] -= pointsToRedeem;
        
        emit RewardRedeemed(msg.sender, pointsToRedeem, rewardDescription);
    }

    /**
     * @notice Consulta externa del balance disponible de EcoPoints.
     */
    function balanceOf(address citizen) external view returns (uint256) {
        return _balances[citizen];
    }

    /**
     * @notice Consulta externa del impacto ambiental acumulado individualmente (en Kg).
     */
    function getTotalRecycled(address citizen) external view returns (uint256) {
        return _totalRecycledKg[citizen];
    }
}
